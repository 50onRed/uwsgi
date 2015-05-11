#
# Cookbook Name:: uwsgi
# Provider:: default
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

action :enable do
  # Create the symlink in the config path
  link config_name do
    to new_resource.name
  end
  new_resource.updated_by_last_action(true)
end

action :disable do
  # Remove the symlink from the config path
  link config_name do
    action :delete
    only_if "test -L #{config_name}"
  end
  new_resource.updated_by_last_action(true)
end

def config_name
  ::File.join(node['uwsgi']['config_path'], new_resource.name.split('/').last)
end
