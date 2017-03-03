require File.expand_path('../../../../spec/spec_helper', __FILE__)
require File.expand_path('../../../../libraries/models/tenant_model', __FILE__)

describe 'TenantModel' do #todo this class needs to test the validation that is still missing
  context 'valid constructor' do
    subject(:tenant) { TenantModel.new('http://10.0.2.15:5000', 'tenant_name', 'username', 'password')}

    context 'provider' do
      it 'are valid'
      it 'are not valid'
    end

    context 'the first parameter of the constructor "endpoint" will be parsed' do
      it 'scheme' do
        expect(tenant.scheme).to be == 'http'
      end
      it 'host' do
        expect(tenant.host).to be == '10.0.2.15'
      end
      it 'port' do
        expect(tenant.port).to be == '5000'
      end
    end

    context 'scheme' do
      it 'are valid protocols'
      it 'are not valid protocols '
    end

    it 'serialize_object returns valid json object' do

    end
  end
end