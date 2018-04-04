source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.5"
gem "sqlite3"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "bootstrap-sass", "3.3.7"
gem "config", "~> 1.7"
gem "jquery-rails", "~> 4.3", ">= 4.3.1"
gem "rails-ujs", "~> 0.1.0"
gem "kaminari", "~> 1.1", ">= 1.1.1"
gem "kaminari-bootstrap", "~> 3.0", ">= 3.0.1"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1", ">= 3.1.11"
gem "faker", "~> 1.8", ">= 1.8.7"
gem "will_paginate", "~> 3.1", ">= 3.1.6"
gem "will_paginate-bootstrap", "~> 1.0", ">= 1.0.1"
gem "carrierwave", "~> 1.2", ">= 1.2.2"
gem "mini_magick", "~> 4.8"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "fog", "~> 2.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
