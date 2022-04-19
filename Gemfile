source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'cancancan', '~> 1.15'

gem 'pg'
gem "blacklight", '~> 7.3.0'
gem 'solr_wrapper', '~> 2.1'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development
gem 'capistrano', '3.7.2'
gem 'capistrano-yarn'
gem 'sshkit', '1.12.0'
gem 'ffi'
gem 'whenever', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # Use sqlite3 as the database for Active Record
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem "rspec-rails"
  gem 'rails-controller-testing'
  gem "factory_bot_rails", require: false
  gem "pry-byebug"
  gem "rubocop-rspec"
  gem 'selenium-webdriver'
  gem "timecop"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano-passenger'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rsolr', '~> 1.0'
gem "devise"
gem 'devise-guests', '~> 0.5'
gem 'omniauth-cas'
gem 'select2-rails'
gem 'ckeditor', '~> 4.2.4'

gem 'pul-assets', path: '../pul_assets'

# static pages
gem 'high_voltage', '~> 3.1'

# lux dependency
gem 'webpacker'

gem 'bootstrap', '~> 4.6'