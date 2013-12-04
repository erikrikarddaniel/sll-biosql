source 'https://rubygems.org'

gem 'rails', "3.2.15"
gem 'bio'
gem 'composite_primary_keys'
# Batch import 
gem 'activerecord-import', '0.3.1'


# Deployment
gem 'capistrano'
gem 'rvm-capistrano'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

#gem used for including sql-views in the schema.rb
#so that they can be used in tests.
gem 'schema_plus'

# For the non_rails_stuff/scripts/dirlist2format script
gem 'amatch'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '2.8.1'
  gem 'annotate', '~> 2.4.1.beta'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
  gem 'autotest-standalone', :require => 'autotest'
  gem 'autotest-rails-pure'
  gem 'term-ansicolor'
  gem 'launchy'
  gem 'rspec-html-matchers'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '0.10.1', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
