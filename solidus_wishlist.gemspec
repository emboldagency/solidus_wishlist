lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'solidus_wishlist/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_wishlist'
  s.version     = SolidusWishlist.version
  s.summary     = 'Add wishlists to Spree'
  s.description = s.summary
  s.required_ruby_version = '>= 2.1.0'

  s.authors = ['John Dyer', 'Allison Reilly']
  s.email       = 'jdyer@spreecommerce.com'
  s.homepage    = 'https://github.com/boomerdigital/solidus_wishlist'
  s.license     = 'BSD-3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_path  = 'lib'
  s.requirements << 'none'

  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'solidus_core', ['>= 1.2.0', '< 5.0']
  s.add_dependency 'solidus_support'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'poltergeist', '~> 1.6.0'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'sass-rails', '~> 5.0.0'
  s.add_development_dependency 'shoulda-matchers', '~> 6.0'
  s.add_development_dependency 'simplecov', '~> 0.22.0'
  s.add_development_dependency 'sqlite3', '>= 2.1'
end
