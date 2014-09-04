require 'spec_helper'

describe('icinga2', :type => :class) do

  context 'with ensure => running' do
    let(:params) { {:ensure => 'running'} }
    it do
      should contain_service('icinga2').with({
        'ensure' => 'running',
      })
    end
  end

  context 'with ensure => stopped' do
    let(:params) { {:ensure => 'stopped'} }
    it do
      should contain_service('icinga2').with({
        'ensure' => 'stopped',
      })
    end
  end
 
  context 'with ensure => foo' do
    let(:params) { {:ensure => 'foo'} }
    it do
      expect {
        should contain_service('icinga2')
      }.to raise_error(Puppet::Error, /ensure must be running or stopped/)
    end
  end

  context 'with constants => { foo => foobar }' do
    let :params do {
      'constants' => {
        'foo' => 'foobar',
      },
    }
    end
    it do
      should contain_file('/etc/icinga2/constants.conf') \
        .with_content(/^const\s*foo\s*=\s*"foobar"$/)
    end
  end

  context 'with constants => no hash' do
    let(:params) { {:constants => 'aaa'} }
    it do
      expect {
        should contain_file('/etc/icinga2/constants.conf')
      }.to raise_error(Puppet::Error, /is not a Hash/)
    end
  end

end
