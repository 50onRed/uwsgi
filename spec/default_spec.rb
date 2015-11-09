# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'uwsgi::default' do
  let (:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['python']['prefix_dir'] = '/usr/local'
    end.converge(described_recipe)
  end

  it 'includes the `python` recipe' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('python')
  end

  it 'installs the `pcre-devel` package' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('pcre-devel')
  end

  it 'installs the `libyaml` package' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_package('libyaml')
  end

  it 'creates a user `uwsgi`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_user('uwsgi').with(
      system: true,
      shell: '/bin/false'
    )
  end

  it 'creates a directory `/var/log/uwsgi`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/var/log/uwsgi').with(
      mode: 0775,
      user: 'nobody',
      group: 'root'
    )
  end

  it 'creates a directory `/etc/uwsgi`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/etc/uwsgi').with(
      mode: 0755,
      user: 'root',
      group: 'root'
    )
  end

  it 'creates a directory `/etc/uwsgi/conf`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/etc/uwsgi/conf').with(
      mode: 0755,
      user: 'root',
      group: 'root'
    )
  end

  it 'creates a directory `/etc/uwsgi/siteconf`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/etc/uwsgi/siteconf').with(
      mode: 0755,
      user: 'root',
      group: 'root'
    )
  end

  it 'creates a directory `/etc/uwsgi/appconf`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/etc/uwsgi/appconf').with(
      mode: 0755,
      user: 'root',
      group: 'root'
    )
  end

  it 'creates a directory `/etc/uwsgi/reload`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/etc/uwsgi/reload').with(
      mode: 0755,
      user: 'root',
      group: 'root'
    )
  end

  it 'creates a directory `/opt/uwsgi`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/opt/uwsgi').with(
      mode: 0755,
      user: 'nobody',
      group: 'nobody'
    )
  end

  it 'creates a directory `/opt/uwsgi/stats`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/opt/uwsgi/stats').with(
      mode: 0755,
      user: 'nobody',
      group: 'nobody'
    )
  end

  it 'creates a directory `/opt/uwsgi/tb`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/opt/uwsgi/tb').with(
      mode: 0755,
      user: 'nobody',
      group: 'nobody'
    )
  end

  it 'includes recipe `uwsgi::install_pip`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('uwsgi::install_pip')
  end

  it 'creates a link `/usr/bin/uwsgi`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_link('/usr/bin/uwsgi').with(
      to: '/usr/local/bin/uwsgi'
    )
  end

  it 'creates a directory `/opt/uwsgi/tb`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/opt/uwsgi/tb').with(
      mode: 0755,
      user: 'nobody',
      group: 'nobody'
    )
  end

  it 'includes recipe `uwsgi::init`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('uwsgi::init')
  end

  it 'creates a template `/etc/logrotate.d/uwsgi`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_template('/etc/logrotate.d/uwsgi').with(
      source: 'logrotate.erb',
      mode:   0644,
      owner: 'root',
      group: 'root'
    )
  end
end
