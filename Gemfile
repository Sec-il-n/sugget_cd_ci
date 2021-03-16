source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'devise'
gem 'rails-i18n', '~> 5.1'
gem 'devise-i18n'
gem 'faker'
gem 'seed-fu'
gem 'unicorn'
gem 'mini_racer', platforms: :ruby
gem 'libv8', '~> 8.4', '>= 8.3.255.0'
gem 'aws-sdk-rails'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
gem 'jquery-rails'

gem 'bootstrap', '~> 4.5'
gem 'font-awesome-rails'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'launchy'
  gem 'dotenv-rails'
  gem 'rails-controller-testing'

  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :test do
  gem 'capybara', '>= 2.15'
  # メール送受信のテスト
  gem 'capybara-email'
  gem 'selenium-webdriver'
  gem 'database_cleaner-active_record'
  gem 'webmock'
end
