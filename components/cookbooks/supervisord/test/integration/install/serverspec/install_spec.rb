# test/integration/install/serverspec/install_spec.rb

require 'spec_helper'

describe port(9001) do 
	it { should be_listening.on('127.0.0.1').with('tcp') }
end

describe command('ps -ef|grep "supervisord"') do
  its(:stdout) { is_expected.to match(/supervisord\.conf/) }
end