require 'rspec'
require 'pry'
require 'awesome_print'
require_relative '../lib/mire'
include Mire
RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
end
