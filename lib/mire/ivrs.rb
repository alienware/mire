module Mire
  class Ivrs

    attr_accessor :vendor_client

    def initialize vendor_name
      get_vendor_client(vendor_name)
    end

    def send_sms from, to, body
      vendor_client.send_sms(from, to, body)
    end

    private

    def get_vendor_client vendor_name
      @vendor_client = "::Vendors::#{vendor_name}::Client".constantize.instance
    end
  end
end