require 'singleton'

module Vendors
  module Twilio
    class Client < Mire::Client
      include Singleton

      attr_accessor :client

      def initialize account_credential
        # TODO: hardcoded credentials, find out the ruby way to do this
        account_sid = account_credential[:account_sid]
        auth_token = account_credentials[:auth_token]
        set_up_client(account_sid, auth_token)
      end

      def sanitized_number number
        '+' + number.to_s.gsub('-', '').gsub('+', '').gsub(' ', '')
      end

      def deliver to, body, from=nil
        client.messages.create(
          from: sanitized_number(from).empty? ? '+14843218072' : sanitized_number(number),
          to: sanitized_number(to),
          body: body
        )
      end

      def ring to, url, from=nil
        client.calls.create(
          from: sanitized_number(from).empty? ? '+14843218072' : sanitized_number(number),
          to: sanitized_number(to),
          url: url
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
