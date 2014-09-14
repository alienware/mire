# Make use of core_extension (don't invent the wheel)
require 'active_support'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/kernel/reporting'
require_relative 'mire/version'
require_relative 'mire/mire'
require_relative 'mire/cli'
include Mire
