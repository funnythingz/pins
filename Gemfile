source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.5'

gem 'rails', '~> 4.2.0'
gem 'rake', '~> 10.4.2'
gem 'mysql2'
gem 'sass-rails', '~> 5.0.1'
gem 'compass-rails', '~> 2.0.1', git: 'https://github.com/Compass/compass-rails.git'
gem 'uglifier', '>= 1.3.0'
gem 'slim-rails'

gem 'jquery-rails', '~> 4.0.2'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem "rails_config"

# assets
gem 'rails-assets-bootstrap-fileinput'
gem 'rails-assets-jquery'
gem 'rails-assets-underscore'

# decorate
gem 'draper', '~> 1.3'

# paginate
gem 'kaminari'

# User Authorization
gem 'devise'
gem 'cancancan'

# form helper
gem 'enum_help'
gem 'simple_form', '~> 3.1.0.rc1'

# byStar
gem 'by_star', git: 'https://github.com/radar/by_star.git'
gem 'chronic'

# Image
gem 'carrierwave'
gem "mini_magick"

# my helper
gem 'active_link_to'
gem 'meta-tags'

# validation
gem 'validates_email_format_of'

group :development, :test do
  gem 'typescript-rails', '~> 0.4.2'
  gem 'byebug'
  gem 'web-console', '~> 2.0.0.beta4'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
end

group :development do
  gem "better_errors"
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  gem 'tapp'
end

group :test do
  gem 'faker'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
