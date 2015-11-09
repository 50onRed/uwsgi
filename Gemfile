source 'https://rubygems.org'

gem 'berkshelf'
gem 'coveralls', require: false
gem 'rubocop'

group :development do
  gem 'guard'
  gem 'guard-kitchen'
  gem 'guard-foodcritic', '>= 1.0'
  gem 'foodcritic', '>= 3.0'
  gem 'chefspec', '>= 3.1'
end

group :integration do
  gem 'serverspec'
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
end
