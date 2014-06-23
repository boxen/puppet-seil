require 'spec_helper'

describe 'seil::bind' do
  let(:facts) do
    { :boxen_user => 'smh' }
  end
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

    should contain_property_list_key('seil::bind').with({
      :ensure      => 'present',
      :path        => '/Users/smh/Library/Preferences/org.pqrs.Seil.plist',
      :key         => 'sysctl',
      :value       => {
        'enable_control_l'  => 1,
        'keycode_control_l' => '80',
        'enable_command_l'  => 1,
        'keycode_command_l' => '90'
      },
      :value_type  => 'hash'
    })

    should contain_file('/Users/smh/Library/Preferences/org.pqrs.Seil.plist').with({
      :owner => 'smh',
      :require => 'Property_list_key[seil::bind]'
    })
  end
end
