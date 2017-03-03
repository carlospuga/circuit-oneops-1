require File.expand_path('../../../../../spec/spec_helper', __FILE__)
require File.expand_path('../../../../../libraries/models/lbaas/member_model', __FILE__)
require 'rspec/expectations'

describe 'MemberModel' do

  context 'validate mutable properties' do
    subject(:member) { MemberModel.new('123.123.123.123', 80, 'subnet_id')}

    context 'weight' do
      it 'is string use default value' do
        member.weight = 'weight'
        expect(member.weight).to be == 1
      end
      it 'is above its maximum value' do
        member.weight = 257
        expect(member.weight).to be == 1
      end
      it 'is within its maximum value' do
        member.weight = 256
        expect(member.weight).to be <= 256
      end
      it 'is within its minimum value' do
        member.weight = 0
        expect(member.weight).to be >= 0
      end
      it 'is below its minimum value' do
        member.weight = -1
        expect(member.weight).to be == 1
      end
    end
  end

  context 'serialize_optional_parameters' do
    it 'with tenant_id' do
      member = MemberModel.new('123.123.123.123', 80, 'subnet_id', 'tenant_id')
      expect(member.serialize_optional_parameters).to include(:tenant_id)
    end
    it 'without tenant_id' do
      member = MemberModel.new('123.123.123.123', 80, 'subnet_id', nil)
      expect(member.serialize_optional_parameters).not_to include(:tenant_id)
    end
  end
end