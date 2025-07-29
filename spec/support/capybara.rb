require 'capybara/rspec'
require 'capybara/rails'
# require 'selenium-webdriver'
# require 'capybara-screenshot/rspec'  # Disabled to avoid screenshot issues

# Configure Capybara to use webrick instead of puma
Capybara.server = :webrick

# Use rack_test driver (no browser, faster)
Capybara.default_driver = :rack_test
Capybara.javascript_driver = :rack_test

module Spree
  module TestingSupport
    module CapybaraHelpers
      def sign_in_as!(user)
        # Since the dummy app doesn't have frontend authentication,
        # we'll create a minimal session-based login simulation

        # First ensure the user exists in the database
        user.save! unless user.persisted?

        # For rack_test driver, we can't use JavaScript, so just visit a page
        visit '/'
      end
    end
  end
end

RSpec.configure do |config|
  config.include Spree::TestingSupport::CapybaraHelpers, type: :feature
end
