ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

require File.expand_path("../auth_helper", __FILE__)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.include AuthRequestHelper, :type => :request
  config.include AuthHelper, :type => :controller
end
