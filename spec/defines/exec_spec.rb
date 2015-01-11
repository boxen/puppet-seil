require 'spec_helper'

describe 'seil::exec' do
  let(:version) { '11.0.0' }
  cli = '/Applications/Seil.app/Contents/Library/bin/seil'

  context 'with defaults' do
    let(:title) { 'export' }

    it do
      should contain_class('seil::config')

      should contain_exec('seil::exec export').with({
        :command => "#{cli} export",
        :require => "Exec[launch seil#{version}]"
      })
    end
  end

  context 'with command set to keycode_capslock 80' do
    let(:title) { 'foobar' }
    let(:params) do
      {
        :command => 'keycode_capslock 80'
      }
    end

    it do
      should contain_exec('seil::exec keycode_capslock 80').with({
        :command => "#{cli} keycode_capslock 80",
        :require => "Exec[launch seil#{version}]",
        :unless  => nil
      })
    end
  end

  context 'with unless set to keycode_capslock 80' do
    let(:title) { 'foobar' }
    let(:params) do
      {
        :command => 'keycode_capslock 80',
        :unless  => 'keycode_capslock 80'
      }
    end

    it do
      should contain_exec('seil::exec keycode_capslock 80').with({
        :command => "#{cli} keycode_capslock 80",
        :require => "Exec[launch seil#{version}]",
        :unless => "#{cli} export | grep \"keycode_capslock 80\""
      })
    end
  end

  context 'with onlyif set to keycode_capslock 80' do
    let(:title) { 'foobar' }
    let(:params) do
      {
        :command => 'keycode_capslock 80',
        :onlyif  => 'keycode_capslock 80'
      }
    end

    it do
      should contain_exec('seil::exec keycode_capslock 80').with({
        :command => "#{cli} keycode_capslock 80",
        :require => "Exec[launch seil#{version}]",
        :onlyif => "#{cli} export | grep \"keycode_capslock 80\""
      })
    end
  end
end
