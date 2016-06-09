ENV["RACK_ENV"] ||= "test"
require 'rspec'
require 'capybara/rspec'
require 'pry'
require_relative '../app/server.rb'
require_relative '../app/models/insult.rb'



Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:each) do
    database = Sinatra::Application.db_config[:dbname]
    system("psql #{database} < schema.sql >> /dev/null 2>&1")
    system("psql #{database} < insult_test_data.sql >> /dev/null 2>&1")
  end
end
