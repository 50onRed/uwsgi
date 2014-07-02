directory node['uwsgi']['emperor']['conf_dir'] do
  owner node['uwsgi']['emperor']['user']
  group node['uwsgi']['emperor']['group']
  mode "0755"
  recursive true
end

case node['uwsgi']['emperor']['service']
when "upstart"
  template "/etc/init/uwsgi.conf" do
    source "uwsgi_upstart.erb"
    owner 'root'
    group 'root'
    mode "0644"
    variables ({
        'config_dir' => node['uwsgi']['emperor']['conf_dir'],
        'uwsgi_bin' => node['uwsgi']['emperor']['uwsgi_bin'],
        'uwsgi_opts' => node['uwsgi']['emperor']['uwsgi_opts'],
        'user' => node['uwsgi']['emperor']['user'],
        'group' => node['uwsgi']['emperor']['group'],
    })
    notifies :restart, 'service[uwsgi]'
  end

  service 'uwsgi' do
    provider Chef::Provider::Service::Upstart
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
  end
end
