require_relative 'spec_helper'

describe user('uwsgi') do
  it { should exist }
  it { should have_login_shell '/bin/false' }
end

describe file('/var/log/uwsgi') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 775 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'root' }
end

describe file("#{$node['uwsgi']['config_path']}") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("#{$node['uwsgi']['config_path']}/conf") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("#{$node['uwsgi']['config_path']}/siteconf") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("#{$node['uwsgi']['config_path']}/appconf") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file("#{$node['uwsgi']['config_path']}/reload") do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/opt/uwsgi') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'nobody' }
end

describe file('/opt/uwsgi/stats') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'nobody' }
end

describe file('/opt/uwsgi/tb') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'nobody' }
  it { should be_grouped_into 'nobody' }
end

describe file('/usr/bin/uwsgi') do
  it { should be_linked_to "#{$node['python']['prefix_dir']}/bin/uwsgi" }
end

describe file('/etc/logrotate.d/uwsgi') do
    it { should exist }
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should contain '/var/log/uwsgi/*log {' }
    it { should contain 'copytruncate' }
    it { should contain 'daily' }
    it { should contain 'rotate 10' }
    it { should contain 'missingok' }
    it { should contain 'notifempty' }
    it { should contain 'compress' }
    it { should contain 'sharedscripts' }
    it { should contain '/var/log/uwsgi/*log.1 {' }
    it { should contain 'copytruncate' }
    it { should contain 'daily' }
    it { should contain 'rotate 10' }
    it { should contain 'missingok' }
    it { should contain 'notifempty' }
    it { should contain 'compress' }
    it { should contain 'sharedscripts' }
end
