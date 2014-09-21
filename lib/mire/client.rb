module Mire
  class Client

    attr_accessor :client
    attr_accessor :errors

    def initialize vendor_name, account_credentials
      set_up_client(vendor_name, account_credentials)
    end

    def deliver sms_to_number, sms_body, sms_from_number
      client.deliver(sms_to_number, sms_body, sms_from_number)
    end

    def ring call_to_number, call_body, call_from_number
      client.ring(call_to_number, call_body, call_from_number)
    end

    private

    def set_up_client vendor_name, account_credentials
      @client = Vendors::Unsupported::Client.instance.client
      @errors = OpenStruct.new({ messages: "mire does not support '#{vendor_name}' yet. Currently these IVRS clients are supported: twilio" })
      if ['twilio'].include?(vendor_name)
        @client = Vendors::UnauthenticatedSupported::Client.instance.client
        @errors = OpenStruct.new({ messages: "#{account_credentials} credentials result in unauthorized access at '#{vendor_name}' side" })
        if credentials.present?
          @client ||= vendor_name.constantize.instance.client
        end
      end
    end
  end
end
