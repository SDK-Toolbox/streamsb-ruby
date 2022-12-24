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

- `file_code`: code for file stored in StreamSB `REQUIRED`

#### 2.2 Rename File

```ruby
rename_file = @client.rename_file(file_code, title, name)
```

- `file_code`: code for file stored in StreamSB `REQUIRED`
- `title`: new file title `REQUIRED`
- `name`: new file name `REQUIRED`

#### 2.3 Clone File

```ruby
file_info = @client.clone_file(file_code)
```

- `file_code`: code for file to be cloned `REQUIRED`

#### 2.4 Clone File

```ruby
file_info = @client.list_files(page, per_page, fld_id, is_public, created, title)

```

- `page`: page number `OPTIONAL`,
- `per_page`: results per page `OPTIONAL`
- `fld_id`: folder id `OPTIONAL`
- `is_public`: show public (1) or private (0) files only `OPTIONAL`
- `created`: show only files uploaded after timestamp `OPTIONAL`
- `title`: filter video titles `OPTIONAL`

#### 2.5 Get Direct All

```ruby
file_info = @client.get_direct_all(file_code)
```

- `file_code`: file code `REQUIRED`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/[USERNAME>]/streamsb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/streamsb/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Streamsb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/streamsb/blob/main/CODE_OF_CONDUCT.md).
