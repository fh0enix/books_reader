
source "https://rubygems.org"

ruby "3.2.2"

gem "bootsnap", require: false
gem "devise"
gem "rails", "~> 7.1.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "importmap-rails"
gem "simple_form"
gem "tailwindcss-rails"
gem "turbo-rails"

group :test do
  gem "rspec-rails"
  gem "rails-controller-testing"
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov", require: false
end

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "web-console"
end
