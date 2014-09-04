require 'spec_helper'

describe package('icinga2') do
  it { should be_installed }
end

describe service('icinga2') do
  it { should be_enabled   }
  it { should be_running   }
end

describe file('/etc/icinga2/constants.conf') do
  it { should be_file }
  its(:content) { should match /PluginDir/ }
end
