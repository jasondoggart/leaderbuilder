source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'clearance', '~> 1.16', '>= 1.16.1'
gem 'faker', '~> 1.8', '>= 1.8.7'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'bootsnap', require: false
gem 'dotenv-rails', groups: [:development, :test]
gem 'pco_api', '~> 1.2', '>= 1.2.2'
gem "autoprefixer-rails"



group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'capybara', '~> 3.0', '>= 3.0.1'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 1.0'
end

group :test do
  gem 'webmock', '~> 3.3'
  gem 'selenium-webdriver', '~> 3.11'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
