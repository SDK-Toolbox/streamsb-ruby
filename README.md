# Streamsb Ruby Client

## Installation

Install the gem and add to the application's Gemfile by executing:

    bundle add streamsb

If bundler is not being used to manage dependencies, install the gem by executing:

    gem install streamsb

## Usage

### Initialize Streamsb Client

```ruby
require "streamsb"

@client = Streamsb::Client.new(api_key: ENV['STREAMSB_API_KEY'])
```

Make API calls using the @client object

### 1. Account

#### 1.1 Info

```ruby
account_info = @client.account_info
```

#### 1.2 Stats

```ruby
account_info = @client.account_stats
```

### 2. File

#### 2.1 File Info

```ruby
file_info = @client.file_info(file_code)
```

- `file_code`: file code `REQUIRED`

#### 2.2 Rename File

```ruby
rename_file = @client.rename_file(file_code, title, name)
```

- `file_code`: file code `REQUIRED`
- `title`: new file title `REQUIRED`
- `name`: new file name `REQUIRED`

#### 2.3 Clone File

```ruby
clone_info = @client.clone_file(file_code)
```

- `file_code`: file code `REQUIRED`

#### 2.4 List Files

```ruby
file_list = @client.list_files(page, per_page, fld_id, is_public, created, title)

```

- `page`: page number `OPTIONAL`,
- `per_page`: results per page `OPTIONAL`
- `fld_id`: folder id `OPTIONAL`
- `is_public`: show public (1) or private (0) files only `OPTIONAL`
- `created`: show only files uploaded after timestamp `OPTIONAL`
- `title`: filter video titles `OPTIONAL`

#### 2.5 Get Direct All

```ruby
direct_all = @client.get_direct_all(file_code)
```

- `file_code`: file code `REQUIRED`

#### 2.6 Get Direct Quality

```ruby
direct_quality = @client.get_direct_quality(file_code, quality)
```

- `file_code`: file code `REQUIRED`
- `quality`: video quality if exist, possible values: `n` , `h` , `l` `OPTIONAL`

### 2.7 Set Folder

```ruby
set_folder = @client.set_folder(file_code, folder_id)
```

- `file_code`: file code `REQUIRED`
- `folder_id`: folder id `REQUIRED`

## 3. Folder

### 3.1 List Files

```ruby
files = @client.folder_list(folder_id)
```

- `folder_id`: file code `REQUIRED`

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/ochiengotieno304/streamsb-ruby>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ochiengotieno304/streamsb-ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Streamsb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ochiengotieno304/streamsb-ruby/blob/main/CODE_OF_CONDUCT.md).
