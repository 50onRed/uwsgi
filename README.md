Description
===========

Installs and configures uWSGI.
uWSGI is a fast, self-healing and developer/sysadmin-friendly application container server coded in pure C.

Requirements
============

Platform
--------
* Debian, Ubuntu

Cookbooks
---------
* python
* runit

Definitions
==========

uwsgi_service
  :home_path        - path to the app you want to run with uWSGI, default to "/var/www/app"
  :pid_path         - path to pid file for uWSGI, default to "/var/run/uwsgi-app.pid"
  :host             - hostname to run uWSGI on, default to "127.0.0.1"
  :port             - port number to run uWSGI on, default to 8080
  :worker_processes - number of uWSGI workers, default to 2, should probably be relative to the number of CPUs
  :app              - app to run on uwsgi, passed to --module parameted of uWSGI, default to "main:app"

Usage
=====

Add the default uWSGI recipe to install uwsgi through pip.
Define a uWSGI service with a definition like so:

uwsgi_service "myapp" do
  home_path "/var/www/app"
  pid_path "/var/run/uwsgi-app.pid"
  host "127.0.0.1"
  port 8080
  worker_processes 2
  app "flask:app"
end
