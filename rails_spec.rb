require 'spec_helper'

describe port(80) do
  it { should be_listening }
end

describe port(22) do
  it { should be_listening }
end

describe file('/etc/sysconfig/clock') do
  its(:content) { should match /ZONE="Asia\/Tokyo"/ }
end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe process("puma") do
  its(:count) { should eq 1 }
end

describe command('mysql --version') do
  its(:stdout) { should match /8\.0\./ }
end

describe file('/var/www/tutorial-04/.ruby-version') do
  its(:content) { should match /ruby-2\.6\.3/ }
end

describe command('~/.rbenv/shims/gem list | grep bundler') do
  let(:sudo_options) { '-u ec2-user -i' }
  its(:stdout) { should match /2\.2\.17/ }
end

describe command('~/.rbenv/shims/gem list | grep rails') do
  let(:sudo_options) { '-u ec2-user -i' }
  its(:stdout) { should match /6\.0\.4/ }
end

describe command('~/.rbenv/shims/gem list') do
  let(:sudo_options) { '-u ec2-user -i' }
  its(:stdout) { should match /mysql2/ }
end

# nginxの設定ファイルの有無を確認
describe command('ls /etc/nginx/conf.d/') do
  its(:stdout) { should match /.*\.conf/ }
end

describe file('/var/www/tutorial-04/config/puma.rb') do
  its(:content) { should match /bind "unix:.*\/tmp\/sockets\/puma\.sock/ }
end

describe file('/var/www/tutorial-04/config/database.yml') do
  its(:content) { should match /host:.*Rails\.application\.credentials/ }
end

describe file('/var/www/tutorial-04/config/master.key') do
  it { should exist }
end

describe file('/var/www/tutorial-04/config/environments/development.rb') do
  its(:content) { should match /config\.hosts\.clear/ }
end
