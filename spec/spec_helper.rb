require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

begin
  require File.expand_path('dummy/config/environment', __dir__)
rescue LoadError
  puts 'Could not load dummy application. Please ensure you have run `bundle exec rake test_app`'
  exit
end

require 'rspec/rails'
require 'shoulda-matchers'
require 'pry'
require 'ffaker'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].sort.each { |file| require file }

Dir[File.join(File.dirname(__FILE__), 'factories/*.rb')].sort.each { |f| require f }

# Ensure decorators are loaded for tests
user_decorator_path = File.expand_path('../app/models/spree/user_decorator', __dir__)
variant_decorator_path = File.expand_path('../app/models/spree/variant_decorator', __dir__)

require user_decorator_path if File.exist?(user_decorator_path)
require variant_decorator_path if File.exist?(variant_decorator_path)

# Force load the decorators into the classes immediately
if defined?(Spree::UserDecorator) && !Spree.user_class.included_modules.include?(Spree::UserDecorator)
  Spree.user_class.include Spree::UserDecorator
end

if defined?(Spree::VariantDecorator) && !Spree::Variant.included_modules.include?(Spree::VariantDecorator)
  Spree::Variant.include Spree::VariantDecorator
end

# Also setup after_initialize as a backup
Rails.application.config.after_initialize do
  if defined?(Spree::UserDecorator) && !Spree.user_class.included_modules.include?(Spree::UserDecorator)
    Spree.user_class.include Spree::UserDecorator
  end

  if defined?(Spree::VariantDecorator) && !Spree::Variant.included_modules.include?(Spree::VariantDecorator)
    Spree::Variant.include Spree::VariantDecorator
  end
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.fail_fast = false
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  # Force decorators to be loaded before each example
  config.before(:each) do
    unless Spree.user_class.included_modules.include?(Spree::UserDecorator)
      Spree.user_class.include Spree::UserDecorator
    end

    unless Spree::Variant.included_modules.include?(Spree::VariantDecorator)
      Spree::Variant.include Spree::VariantDecorator
    end
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
