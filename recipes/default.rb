#
# Cookbook Name:: uwsgi
# Recipe:: default
#
# Copyright 2012, 50onRed
#
# All rights reserved - Do Not Redistribute
#

include_recipe "python"

# needed for uwsgi starting with version 1.3
package "libssl0.9.8" do
  action :upgrade
end

python_pip "uwsgi" do
  action :install
  version node["uwsgi"]["version"]
end
