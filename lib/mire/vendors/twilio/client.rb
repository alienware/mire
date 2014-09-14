require 'singleton'

module Vendors
  module Twilio
    class Client
      include Singleton

      attr_accessor :client

      def initialize
        # TODO: hardcoded credentials, find out the ruby way to do this
        account_sid = 'ACbad86866de240e9344b60b09c9318c45'
        auth_token = '4927df3aec562a6e295d2f19010bfec1'
        set_up_client(account_sid, auth_token)
      end

      def send_sms from, to, body
        client.messages.create(
          :from => '+14843218072',
          :to => '+919892690153',
          :body => 'Hey there!'
        )
      end

      private

      def set_up_client account_sid, auth_token
        # set up a client to talk to the Twilio REST API
        @client ||= ::Twilio::REST::Client.new(account_sid, auth_token)
      end
    end
  end
end
