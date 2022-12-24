# frozen_string_literal: true

require_relative "lib/streamsb/version"

Gem::Specification.new do |spec|
  spec.name = "streamsb"
  spec.version = Streamsb::VERSION
  spec.authors = ["Ochieng Otieno"]
  spec.email = ["ochiengotieno71@gmail.com"]

  spec.summary = "StreamSB ruby client"
  spec.description = "StreamSB ruby client"
  spec.homepage = "https://github.com/ochiengotieno304/streamsb-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/ochiengotieno304/streamsb-ruby/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.7"
  spec.add_dependency "faraday_middleware", "~> 1.2"
  spec.add_dependency "json"
end
