#
# Cookbook Name:: uwsgi
# Recipe:: default
#
# Copyright:: Copyright (c) 2013, Damon Jablons
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "python"

package 'pcre-devel'

python_pip "setuptools" do
  action :upgrade
end

#Create uwsgi user
user "uwsgi" do
  system true
  shell  '/bin/false'
end

directory "/var/log/uwsgi" do
 mode 0775
 owner "nobody"
 group "root"
end

directory "/etc/uwsgi" do
 mode 0755
 owner "root"
 group "root"
end

directory "/etc/uwsgi/conf" do
 mode 0755
 owner "root"
 group "root"
end

directory "/etc/uwsgi/siteconf" do
 mode 0755
 owner "root"
 group "root"
end

directory "/etc/uwsgi/appconf" do
 mode 0755
 owner "root"
 group "root"
end


directory "/etc/uwsgi/reload" do
 mode 0755
 owner "root"
 group "root"
end

directory "/opt/uwsgi" do
 mode 0755
 owner "nobody"
 group "nobody"
end

directory "/opt/uwsgi/stats" do
 mode 0755
 owner "nobody"
 group "nobody"
end

directory "/opt/uwsgi/tb" do
 mode 0755
 owner "nobody"
 group "nobody"
end


# Install the latest version with pip
python_pip "uwsgi" do
  version "1.9.18.2"
  action :install
end

# Add the uwsgi config directory
directory node['uwsgi']['config_path'] do
  owner "root"
  group "root"
  mode 0755
end

link "/usr/bin/uwsgi" do
  to "#{node['python']['prefix_dir']}/bin/uwsgi"
end

# Add an upstart script
include_recipe "uwsgi::init"

#Add log rotation
template "/etc/logrotate.d/uwsgi" do
  source "logrotate.erb"
  mode 0644
  owner "root"
  group "root"
end
