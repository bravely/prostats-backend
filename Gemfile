source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'pg'
gem 'passenger'
# gem 'active_model_serializers', '~>0.10.0.rc2'
gem 'active_model_serializers',
  git: 'git@github.com:bravely/active_model_serializers.git',
  branch: 'feature/default-json-api-to-dasherized-keys'

gem 'dotenv-rails'
gem 'devise'
gem 'lolesports-api', '~> 0.2'
gem 'slowweb'
gem 'kaminari'

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
  gem 'vcr'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webrat'
  gem 'should_not'
  gem 'webmock'
end

group :ct do
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
  gem 'guard-brakeman'
end
