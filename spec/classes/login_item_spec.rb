require 'spec_helper'

describe 'seil::login_item' do
  it do
    should contain_class('seil::config')

    should contain_exec('launch seil').with({
      :command     => '/usr/bin/open /Applications/Seil.app',
      :refreshonly => true,
      :subscribe   => 'Package[Seil_10.8.0]',
      :require     => 'Osx_login_item[Seil]'
    })
  end

  context 'with ensure defaulted' do
    it do
      should contain_osx_login_item('Seil').with({
        :ensure  => 'present',
        :path    => '/Applications/Seil.app',
        :require => 'Package[Seil_10.8.0]'
      })
    end
  end

  context 'with ensure set to present' do
    let(:params) do
      {
        :ensure => 'present'
      }
    end

    it do
      should contain_osx_login_item('Seil').with({
        :ensure  => 'present',
        :path    => '/Applications/Seil.app',
        :require => 'Package[Seil_10.8.0]'
      })
    end
  end

  context 'with ensure set to absent' do
    let(:params) do
      {
        :ensure => 'absent'
      }
    end

    it do
      should contain_osx_login_item('Seil').with({
        :ensure  => 'absent',
        :path    => '/Applications/Seil.app',
        :require => 'Package[Seil_10.8.0]'
      })
    end
  end
end

