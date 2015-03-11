require 'spec_helper'

describe package('openssl') do
  it { should be_installed }
end

describe file('/etc/passwords') do
  it { should be_directory }
end

describe file('/etc/passwords/foo.htpasswd') do
  it { should be_file }
  it { should be_owned_by 'root'}
  it { should be_mode 644 }
  its(:content) { should match /admin/ }
  its(:content) { should match /foo/ }
end

describe file('/etc/passwords/bar.htpasswd') do
  it { should be_file }
  it { should be_owned_by 'root'}
  it { should be_mode 644 }
  its(:content) { should match /admin/ }
  its(:content) { should match /bar/ }
end

