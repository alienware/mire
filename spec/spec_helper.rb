require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'rspec'
require 'pry'
require 'awesome_print'
require 'coveralls'
Coveralls.wear!
require 'factory_girl'
require 'faker'

require_relative '../lib/mire'
include Mire
RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
end
