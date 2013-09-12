default['uwsgi']['emperor']['conf_dir'] = "/etc/uwsgi"

case node['platform']
when "ubuntu", "debian"
 default['uwsgi']['emperor']['service'] = "upstart"
end
