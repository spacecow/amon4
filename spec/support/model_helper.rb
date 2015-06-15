require 'factory_girl_rails'
require 'factories'
ENV['RACK_ENV'] = "test"
require 'active_record'
require './config/database'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
