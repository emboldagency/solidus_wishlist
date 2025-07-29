source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'main')
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_auth_devise', github: 'solidusio/solidus_auth_devise'

if %w[master main].include?(branch) || branch >= 'v2.3'
  gem 'rails', '>= 7.0', '< 8.1.0.beta1'
elsif branch >= 'v2.0'
  gem 'rails', '~> 5.0.6'
else
  gem 'rails', '~> 4.2.7'
end

gem 'mysql2', '~> 0.4.10'
gem 'pg', '~> 0.21'

group :development, :test do
  gem 'sqlite3', '>= 2.1'
  if %w[master main].include?(branch) || branch >= 'v2.0'
    gem 'rails-controller-testing'
  else
    gem 'rails_test_params_backport'
  end

  if branch < 'v2.5'
    gem 'factory_bot', '4.10.0'
  else
    gem 'factory_bot', '> 4.10.0'
  end
end

gem 'observer'

gemspec
