#
# Cookbook Name:: uwsgi
# Definition:: uwsgi_service
#
# Copyright 2012, 50onRed
#
# All rights reserved - Do Not Redistribute
#

define :uwsgi_service, 
    :home_path => "/var/www/app", 
    :pid_path => "/var/run/uwsgi-app.pid", 
    :host => "127.0.0.1", 
    :port => 8080, 
    :worker_processes => 2, 
    :app => "main:app",
    :uid => "www-data",
    :gid => "www-data",
    :master => false,
    :no_orphans => false,
    :die_on_term => false,
    :close_on_exec => false,
    :lazy => false,
    :disable_logging => false,
    :threads => nil,
    :harakiri => nil,
    :stats => nil,
    :emperor => nil,
    :vacuum => false,
    :enable_threads => false do
  include_recipe "runit"

  # need to assign params to local vars as we can't pass params to nested definitions
  home_path = params[:home_path]
  pid_path = params[:pid_path]
  host = params[:host]
  port = params[:port]
  worker_processes = params[:worker_processes]
  app = params[:app]
  uid = params[:uid]
  gid = params[:gid]
  extra_params = ""
  extra_params += " --master" if params[:master]
  extra_params += " --lazy" if params[:lazy]
  extra_params += " --no-orphans" if params[:no_orphans]
  extra_params += " --die-on-term" if params[:die_on_term]
  extra_params += " --close-on-exec" if params[:close_on_exec]
  extra_params += " --disable-logging" if params[:disable_logging]
  extra_params += " --enable-threads" if params[:enable_threads]
  extra_params += " --vacuum" if params[:vacuum]
  extra_params += " --threads %d" % [params[:threads]] if params[:threads]
  extra_params += " --harakiri %d" % [params[:harakiri]] if params[:harakiri]
  extra_params += " --stats %s" % [params[:stats]] if params[:stats]
  extra_params += " --emperor %s" % [params[:emperor]] if params[:emperor]
  
  runit_service "uwsgi-#{params[:name]}" do
    template_name "uwsgi"
    cookbook "uwsgi"
    options ({
      :home_path => home_path,
      :pid_path => pid_path,
      :host => host,
      :port => port,
      :worker_processes => worker_processes,
      :app => app,
      :uid => uid,
      :gid => gid,
      :extra_params => extra_params
    })
  end
end
