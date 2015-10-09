require 'spec_helper'

describe 'seil' do
  it do
    should contain_class('seil::config')

    should contain_package('Seil_11.3.0').with({
      :ensure   => 'installed',
      :source   => 'https://pqrs.org/osx/karabiner/files/Seil-11.3.0.dmg',
      :provider => 'pkgdmg'
    })
  end
end
