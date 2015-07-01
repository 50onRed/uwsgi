require_relative 'spec_helper'

describe command('/opt/chef/embedded/bin/gem list') do
  its(:stdout) { should contain('uwsgi') }
  its(:exit_status) { should eq 0 }
end