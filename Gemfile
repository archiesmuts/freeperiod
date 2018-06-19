source 'https://rubygems.org'
source 'https://rails-assets.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app gem 'jsonb_accessor', '~> 1.0'
gem 'jsonb_accessor', '~> 1.0'

gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'high_voltage'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'cocoon', '~> 1.2', '>= 1.2.10'
gem 'bootstrap', '~> 4.1', '>= 4.1.1'
gem 'bootswatch', '~> 4.1', '>= 4.1.1'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem "recaptcha", require: "recaptcha/rails"
gem 'devise_invitable', '~> 1.7', '>= 1.7.2'
gem 'administrate', '~> 0.10.0'

gem 'wicked', '~> 1.3', '>= 1.3.2'
gem 'font_awesome5_rails', '~> 0.3.3'
# the maclover/trix gem does not work with rails 5.2
gem 'trix', git: 'https://github.com/DRBragg/trix'
gem 'sendgrid', '~> 1.2', '>= 1.2.4'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'friendly_id', '~> 5.2', '>= 5.2.1'
gem 'pundit', '~> 1.1'
gem 'rolify', '~> 5.1'
gem 'sequenced', '~> 3.1', '>= 3.1.1'
gem 'fullcalendar-rails', '~> 3.4'
gem 'momentjs-rails', '~> 2.17', '>= 2.17.1'
gem 'acts_as_list', '~> 0.9.9'
gem 'data-confirm-modal', '~> 1.5'
gem 'rails-assets-holderjs', source: 'https://rails-assets.org'
# gem 'sequenced', '~> 3.1', '>= 3.1.1'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
# gem 'aws-sdk-s3', '~> 1.13', require: false
# gem 'image_processing', '~> 1.2'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'faker', '~> 1.6', '>= 1.6.3'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
end

ruby '2.5.1'
