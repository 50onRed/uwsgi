default['uwsgi']['emperor']['conf_dir'] = "/etc/uwsgi"
default['uwsgi']['emperor']['uwsgi_bin'] = 'uwsgi'
default['uwsgi']['emperor']['uwsgi_opts'] = '--master --die-on-term --emperor'
default['uwsgi']['emperor']['user'] = 'root'
default['uwsgi']['emperor']['group'] = 'root'

case node['platform']
when "ubuntu", "debian"
 default['uwsgi']['emperor']['service'] = "upstart"
end
