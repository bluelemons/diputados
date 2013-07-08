source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'rails-i18n'

group :production do
  gem 'thin', :require => false
  gem 'mysql2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'coffee-script-source', '~> 1.4.0'
  gem 'therubyracer', '~> 0.10.2'
  gem 'uglifier', '>= 1.0.3'
end

gem "activeadmin", "~> 0.5.1"
gem 'cancan'

gem 'jquery-rails', '~> 2.3.0'
gem 'jquery-ui-rails'
gem 'chosen-rails'

gem "paperclip", "~> 3.0"

group :development, :test do
  # database
  gem 'sqlite3'
  gem 'debugger'
  #gem 'pry'
  #gem 'pry-doc'
  #gem 'pry-byebug'
  gem "rspec-rails", ">= 2.11.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "factory_girl_rails"
  gem 'fakeweb'
  gem "better_errors"
  gem "binding_of_caller"
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
  gem 'dbf', git: 'https://github.com/eloyesp/dbf.git'
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
gem 'newrelic_rpm'

gem 'rails_backend', git: 'https://github.com/olvap/rails_backend.git'
# TODO Arreglar dependencias y sacar estas gemas de aca
  gem 'inherited_resources', '>= 1.3.1'
  gem 'will_paginate', '~> 3.0'
  gem 'ransack'
  gem 'simple_form'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails", '~> 2.2.7'
# hasta aca

  gem 'guard'
  gem 'guard-livereload'
  gem "select2-rails"
