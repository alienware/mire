module Mire
  CustomError = Class.new(StandardError)
  class << self
    # main helper method
    def helper
      puts 'FYI: Mire::helper()'
    end
  end
end
