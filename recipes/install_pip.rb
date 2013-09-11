#
# Cookbook Name:: uwsgi
# Recipe:: install_pip
#
# Copyright 2012, 50onRed
#
# All rights reserved - Do Not Redistribute
#

include_recipe "python"

case node[:platform_family]
when 'debian'
	# needed for uwsgi starting with version 1.3
	package "libssl0.9.8" do
	  action :upgrade
	end
end

python_pip "uwsgi" do
  action :install
  version node["uwsgi"]["version"]
end
