require_relative 'spec_helper'

describe file('/etc/init.d/uwsgi') do
  it { should exist }
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'UWSGI="/usr/bin/uwsgi"' }
  it { should contain 'prog="uwsgi"' }
  it { should contain "UWSGI_INI=\"#{$node['uwsgi']['config_path']}/uwsgi.ini\"" }
  it { should contain "UWSGI_LOG_DIR=\"#{$node['uwsgi']['log_path']}\"" }
end

describe service('uwsgi') do
  it { should be_enabled }
  it { should be_running }
end