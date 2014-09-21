require 'singleton'

module Vendors
  module Unsupported
    class Client < OpenStruct
      include Singleton

      attr_accessor :client

      # TODO: Respond with requested vendor name in case of spelling mistakes
      @client = nil

      def deliver to, body, from=nil
        OpenStruct.new
      end

      def ring to, url, from=nil
        OpenStruct.new
      end
    end
  end
end
