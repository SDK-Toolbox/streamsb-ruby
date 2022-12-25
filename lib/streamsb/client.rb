# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "json"

module Streamsb
  class Client
    API_ENDPOINT = "https://api.streamsb.com/api"

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def account_info
      request(http_method: :get, endpoint: "account/info", params: payload)
    end

    def account_stats
      request(http_method: :get, endpoint: "account/stats", params: payload)
    end

    def file_info(file_code)
      data = {
        file_code: file_code
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "file/info", params: params)
    end

    def rename_file(file_code, title, name)
      data = {
        file_code: file_code,
        title: title,
        name: name
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "file/rename", params: params)
    end

    def clone_file(file_code)
      data = {
        file_code: file_code
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "file/clone", params: params)
    end

    def list_files(page = nil, per_page = nil, fld_id = nil, is_public = nil, created = nil, title = nil)
      data = {
        page: page,
        per_page: per_page,
        fld_id: fld_id,
        public: is_public,
        created: created,
        title: title
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "file/list", params: params)
    end

    def get_direct_all(file_code)
      data = {
        file_code: file_code
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "file/direct", params: params)
    end

    def get_direct_quality(file_code, quality = nil)
      data = {
        file_code: file_code,
        q: quality
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "file/direct_link", params: params)
    end

    def set_folder(file_code, folder_id)
      data = {
        file_code: file_code,
        fld_id: folder_id
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "file/set_folder", params: params)
    end

    def folder_list(folder_id)
      data = {
        fld_id: folder_id
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "folder/list", params: params)
    end

    def create_folder(name, folder_id = nil)
      data = {
        name: name,
        fld_id: folder_id
      }

      params = payload.merge!(data)
      request(http_method: :get, endpoint: "folder/create", params: params)
    end

    def upload_server
      request(http_method: :get, endpoint: "upload/server", params: payload)
    end

    def inspect
      "#<Streamsb::Client>"
    end

    private

    def payload
      {
        key: api_key
      }
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = API_ENDPOINT
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end

    def request(http_method:, endpoint:, params: { key: api_key })
      response = connection.send(http_method, endpoint, params)
      OpenStruct.new(response.body)
    end
  end
end
