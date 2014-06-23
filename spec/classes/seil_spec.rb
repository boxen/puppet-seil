require 'spec_helper'

describe 'seil' do
  it do
    should contain_class('seil::config')

    should contain_package('Seil_10.8.0').with({
      :ensure   => 'installed',
      :source   => 'https://pqrs.org/macosx/keyremap4macbook/files/Seil-10.8.0.dmg',
      :provider => 'pkgdmg'
    })
  end
end
