source 'https://rubygems.org'

gem 'rails', '4.2.1'
gem 'pg'
gem 'unicorn'
gem 'active_model_serializers', '~> 0.8.3'
gem 'dotenv-rails'
gem 'devise'

group :development, :test do
  gem 'pry-rails'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'mailcatcher'
  gem 'bundler-audit'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webrat'
  gem 'should_not'
end

group :ct do
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'guard-brakeman'
end
