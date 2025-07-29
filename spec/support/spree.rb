require 'solidus_core/testing_support/factories'
require 'solidus_core/testing_support/controller_requests'
require 'solidus_core/testing_support/authorization_helpers'
require 'solidus_core/testing_support/url_helpers'

RSpec.configure do |config|
  config.include SolidusCore::TestingSupport::ControllerRequests, type: :controller
  config.include SolidusCore::TestingSupport::UrlHelpers
end
