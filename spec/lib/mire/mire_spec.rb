require_relative '../../spec_helper'
describe Mire do
  context '#dummy_test' do
    it 'passes the simple test' do
      expect('test string').to_not be_nil
    end
  end
end
