require_relative '../../spec_helper'
describe Client do

  describe 'Get client object' do

    context '#unsupported client' do
      let(:client_name) { 'twilo' }
      let(:credentials) { {account_sid: 'ACbad86866de240e9344b60b09c9318c45', auth_token: '4927df3aec562a6e295d2f19010bfec1'} }
      subject { Mire::Client.new(client_name, credentials) }

      it 'should return errors with list as supported clients as message' do
        expect(subject.errors).not_to be_empty
        expect(subject.errors.messages).to include("mire does not support '#{subject.name}' yet. Currently these IVRS clients are supported: twilio")
      end
    end

    context '#unauthorized supporteded client' do
      let(:client_name) { 'twilio' }
      let(:credentials) { {} }
      subject { Mire::Client.new(client_name, credentials) }

      it 'should return errors with unauthorized access as message' do
        expect(subject.errors).not_to be_empty
        expect(subject.errors.messages).to eq "#{subject.credentials} credentials result in unauthorized access at '#{subject.client}'' side"
      end
    end

    context '#supported and authorized client' do
      let(:client_name) { 'twilio' }
      let(:credentials) { {account_sid: 'ACbad86866de240e9344b60b09c9318c45', auth_token: '4927df3aec562a6e295d2f19010bfec1'} }
      subject { Mire::Client.new(client_name, credentials) }

      it 'should return an object of type Mire::Client' do
        expect(subject).to be_kind_of(Mire::Client)
      end
    end

  end

  describe 'Do boring IVRS stuff zzz...' do

    context '#sms send' do
      let(:client_name) { 'twilio' }
      let(:credentials) { {account_sid: 'ACbad86866de240e9344b60b09c9318c45', auth_token: '4927df3aec562a6e295d2f19010bfec1'} }
      subject { Mire::Client.new(client_name, credentials) }

      let(:sms_to_number) { 919892690153 }
      let(:sms_body) { 'This is a test sms body.' }
      let(:sms_from_number) { 14843218072 }
      let(:output) { subject.deliver(client_name, sms_to_number, sms_body, sms_from_number) }

      it 'should receive success status from the third-party' do
        expect(output.delivery_status).to eq '200'
      end

      it 'should respond with third-party sms ID' do
        expect(output.sms_id).to be_present
      end
    end

    # context '#get status' do
    #   let(:client_name) { "::Vendors::Twilio::Client".constantize.instance }
    #   let(:output) { Mire::Client.get_status(client_name, sms_id) }

    #   it 'should get current status of the sms from the third-party' do

    #   end
    # end

    context '#make a call' do
      let(:client_name) { 'twilio' }
      let(:credentials) { {account_sid: 'ACbad86866de240e9344b60b09c9318c45', auth_token: '4927df3aec562a6e295d2f19010bfec1'} }
      subject { Mire::Client.new(client_name, credentials) }

      let(:call_to_number) { 919892690153 }
      let(:call_body) {}
      let(:call_from_number) { 14843218072 }
      let(:output) { subject.ring(client_name, call_to_number, call_body, call_from_number) }

      it 'should receive success status from the third-party' do
        expect(output.delivery_status).to eq 200
      end

      it 'should respond with third-party call ID' do

      end
    end
  end
end

