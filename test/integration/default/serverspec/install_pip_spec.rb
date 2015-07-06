require_relative 'spec_helper'

describe command("pip list") do
  its(:stdout) { should contain "uWSGI" }
  its(:exit_status) { should eq 0 }
end