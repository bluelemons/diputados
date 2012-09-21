source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'rails-i18n'

gem 'mysql2'

group :production do
  gem 'thin', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

gem 'activeadmin'
gem 'cancan'

gem 'jquery-rails'

gem "paperclip", "~> 3.0"

group :development, :test do
  # database
  gem 'sqlite3'
  # debugger
  gem 'pry'
  gem 'pry-doc'
  gem "rspec-rails", ">= 2.11.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "factory_girl_rails"
  gem 'fakeweb'
end

group :test do
  gem 'timecop'
  gem 'fakefs', :require => "fakefs/safe"
  gem "capybara", ">= 1.1.2"
  gem "email_spec", ">= 1.2.1"
  gem "database_cleaner", ">= 0.8.0"
  gem "launchy", ">= 2.1.2"
end

group :migrations do
  gem 'dbf', :git=>'https://github.com/eloyesp/dbf.git'
  gem 'seed-fu'
end

gem 'simplecov', :require => false, :group => :test

group :deployment do
  gem 'rvm-capistrano'
  gem 'bundler'
  gem 'capistrano'
end

gem 'odf-report'

gem 'whenever', :require => false
