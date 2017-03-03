require File.expand_path('../../../../../spec/spec_helper', __FILE__)
require File.expand_path('../../../../../libraries/models/lbaas/health_monitor_model', __FILE__)
require 'rspec/expectations'

describe 'HealthMonitorModel' do

  context 'validate mutable properties' do
    subject(:health_monitor) { HealthMonitorModel.new('http', 5, 5, 5)}

    context 'delay' do
      it 'is below minimum' do
        expect { health_monitor.delay = -1 }.to raise_error(ArgumentError)
      end
      it 'is within minimum' do
        health_monitor.delay = 0
        expect(health_monitor.delay).to be == 0
      end
      it 'is within maximum' do
        health_monitor.delay = 86399
        expect(health_monitor.delay).to be == 86399
      end
      it 'is above maximum' do
        expect { health_monitor.delay = 86401 }.to raise_error(ArgumentError)
      end
      it 'will ignore string input instead it will retain constructor value' do
        health_monitor.delay = 'delay'
        expect(health_monitor.delay).to be == 5
      end
    end

    context 'timeout' do
      it 'is below minimum' do
        expect { health_monitor.timeout = -1 }.to raise_error(ArgumentError)
      end
      it 'is within minimum' do
        health_monitor.timeout = 0
        expect(health_monitor.timeout).to be == 0
      end
      it 'is within maximum' do
        health_monitor.timeout = 86399
        expect(health_monitor.timeout).to be == 86399
      end
      it 'is above maximum' do
        expect { health_monitor.timeout = 86401 }.to raise_error(ArgumentError)
      end
      it 'will ignore string input instead it will retain constructor value' do
        health_monitor.timeout = 'timeout'
        expect(health_monitor.timeout).to be == 5
      end
    end

    context 'max_retries' do
      it 'is below minimum' do
        expect { health_monitor.max_retries = 0 }.to raise_error(ArgumentError)
      end
      it 'is within minimum' do
        health_monitor.max_retries = 1
        expect(health_monitor.max_retries).to be == 1
      end
      it 'is within maximum' do
        health_monitor.max_retries = 10
        expect(health_monitor.max_retries).to be == 10
      end
      it 'is above maximum' do
        expect { health_monitor.max_retries = 11 }.to raise_error(ArgumentError)
      end
      it 'will ignore string input instead it will retain constructor value' do
        health_monitor.max_retries = 'max_retries'
        expect(health_monitor.max_retries).to be == 5
      end
    end

    context 'http_method' do
      it 'that are valid' do
        %w(GET POST PUT).each do |http_method|
          health_monitor.http_method = http_method
          expect(health_monitor.http_method).to be == http_method
        end
      end
      it 'that are not valid to throw error' do
        %w(CREATE PATCH).each do |http_method|
          expect{ health_monitor.http_method = http_method }.to raise_error(ArgumentError)
        end
      end
      it 'should always return upcase' do
        %w(get Get gET post Post pOST put Put pUT).each do |http_method|
          health_monitor.http_method = http_method
          expect(health_monitor.http_method).to be == http_method.upcase
        end
      end
    end

  it 'url_path '

  it 'expected codes'
  end
end