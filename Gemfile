# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "money"
gem 'rake', '~> 12.3', '>= 12.3.2'

group :development, :test do
    gem 'guard' # NOTE: this is necessary in newer versions
    gem 'guard-minitest'
end