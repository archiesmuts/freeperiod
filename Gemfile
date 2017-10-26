source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'high_voltage'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'cocoon', '~> 1.2', '>= 1.2.10'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'pg', '~> 0.21.0'
gem 'devise', '~> 4.3'
gem 'devise_invitable', '~> 1.7', '>= 1.7.2'
gem 'wicked', '~> 1.3', '>= 1.3.2'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'trix', '~> 0.11.0'
gem 'sendgrid', '~> 1.2', '>= 1.2.4'
gem 'friendly_id', '~> 5.2', '>= 5.2.1'
gem 'pundit', '~> 1.1'
gem 'rolify', '~> 5.1'
gem 'sequenced', '~> 3.1', '>= 3.1.1'
gem 'fullcalendar-rails', '~> 3.4'
gem 'momentjs-rails', '~> 2.17', '>= 2.17.1'
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
ruby '2.4.2'
