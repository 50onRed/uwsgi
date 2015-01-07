#
# Cookbook Name:: uwsgi
# Recipe:: init
#
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

template "/etc/init.d/uwsgi" do
  source "newrelic_uwsgi.erb"
  mode 0755
  backup false
  owner "root"
  group "root"
  variables({
    :log_path => node['uwsgi']['log_path'],
    :config_path => node['uwsgi']['config_path']
  })
end

service "uwsgi" do
  supports :start => true, :stop => true, :restart => true, :reload => true 
  action [:enable, :start]
end
