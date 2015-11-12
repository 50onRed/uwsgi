Description
===========
Installs and configures uWSGI Emperor.

Requirements
============
## Platforms
* Ubuntu 12.04

## Cookbooks
Requires Opscode's `python` cookbook.

Attributes
==========
* `node['uwsgi']['config_path']` - the path to keep vassal configuration
  files.
* `node['uwsgi']['log_path']` - the path to write the uwsgi log file.

Recipes
=======
default
-------
Installs or upgrades to the package `libssl10.9.8`, then uses `pip` to
install `uwsgi`, finally calling the `upstart` recipe.

upstart
-------
Creates an `upstart` configuration file from the `uwsgi.conf.erb`
template, and reloads the initctl configuration. Next, starts `uwsgi` as
a service, and enables it.

Resources/Providers
===================
### Actions
The default action is `:enable`.
* `:enable` - enables the config file
* `:disable` - disables the config file

### Attribute Parameters
* `:name` - string - the name of the configuration file
* `:path` - string - the full directory path to the configuration file
  to be symlinked into the uwsgi config path

### Examples
```ruby
# ln -s /path/to/my/site/config/my_config.ini /etc/uwsgi/my_config.ini
uwsgi "my_config.ini" do
  action :enable
  path "/path/to/my/site/config"
end
```

```ruby
# rm /etc/uwsgi/my_config.ini
uwsgi "my_config.ini" do
  action :disable
end
```

Usage
=====
Just add `recipe[uwsgi-emperor]` to your node, or role.

```json
{ "run_list": [ "recipe[uwsgi-emperor]" ] }
```
