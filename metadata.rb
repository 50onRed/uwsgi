name             'uwsgi'
maintainer       'Franklin Hanson'
maintainer_email 'fhanson@gannett.com'
license          'Apache 2.0'
description      'Installs uWSGI, with a LWRP for config files'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.5'

recipe 'uwsgi', 'Installs uWSGI and dependencies with pip, calls upstart'
recipe 'uwsgi::init', 'Creates an init script for uWSGI'

depends 'python'
depends 'runit'
