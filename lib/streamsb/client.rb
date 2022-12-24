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
      data = {
        key: api_key
      }
      request(http_method: :post, endpoint: "account/info", params: data)
    end

    def account_stats
      data = {
        key: api_key
      }
      request(http_method: :post, endpoint: "account/stats", params: data)
    end

    def file_info(file_code)
      data = {
        key: api_key,
        file_code: file_code
      }
      request(http_method: :post, endpoint: "file/info", params: data)
    end

    def rename_file(file_code, title, name)
      data = {
        key: api_key,
        file_code: file_code,
        title: title,
        name: name
      }
      request(http_method: :post, endpoint: "file/rename", params: data)
    end

    def clone_file(file_code)
      data = {
        key: api_key,
        file_code: file_code
      }
      request(http_method: :post, endpoint: "file/clone", params: data)
    end

    def inspect
      "#<Streamsb::Client>"
    end

    private

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = API_ENDPOINT
        conn.request :url_encode
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end

    def request(http_method:, endpoint:, params: {key: api_key})
      response = connection.send(http_method, endpoint, params)
      OpenStruct.new(response.body)
    end
  end
end
