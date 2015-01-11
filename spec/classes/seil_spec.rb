require 'spec_helper'

describe 'seil' do
  it do
    should contain_class('seil::config')

    should contain_package('Seil_11.0.0').with({
      :ensure   => 'installed',
      :source   => 'https://pqrs.org/macosx/keyremap4macbook/files/Seil-11.0.0.dmg',
      :provider => 'pkgdmg'
    })
  end
end
