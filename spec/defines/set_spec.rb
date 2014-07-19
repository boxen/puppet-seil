require 'spec_helper'

describe 'seil::set' do
  let(:title) { 'foobar' }
  let(:params) do
    { :value => '28' }
  end

  it do
    should contain_seil__exec('seil::set enable_foobar 1').with({
      :command => "set enable_foobar 1", :unless => "set enable_foobar 1"
    })

    should contain_seil__exec('seil::set keycode_foobar 28').with({
      :command => "set keycode_foobar 28", :unless => "set keycode_foobar 28"
    })
  end

  context 'with identifier set to barfoo and value set to 42' do
    let(:params) do
      { :identifier => 'barfoo', :value => '42' }
    end

    it do
      should contain_seil__exec('seil::set enable_barfoo 1').with({
        :command => "set enable_barfoo 1", :unless => "set enable_barfoo 1"
      })

      should contain_seil__exec('seil::set keycode_barfoo 42').with({
        :command => "set keycode_barfoo 42", :unless => "set keycode_barfoo 42"
      })
    end
  end
end
