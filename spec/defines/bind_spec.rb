require 'spec_helper'

describe 'seil::bind' do
  let(:title) { 'whatever' }
  let(:params) do
    {
      :mappings => {
        'control_l' => '80',
        'command_l' => '90'
      }
    }
  end

  it do
    should contain_class('seil::config')

    should contain_seil__map('control_l').with({ :value => 80 })
    should contain_seil__map('command_l').with({ :value => 90 })
  end
end
