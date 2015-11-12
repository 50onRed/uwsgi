# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'uwsgi::init' do
  let (:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['python']['prefix_dir'] = '/usr/local'
    end.converge(described_recipe)
  end

  it 'creates a template `/etc/init.d/uwsgi`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_template('/etc/init.d/uwsgi').with(
      source: 'uwsgi.erb',
      mode:   0755,
      owner: 'root',
      group: 'root'
    )
  end

  it 'enables service `uwsgi`' do
    expect(chef_run).to enable_service('uwsgi')
    expect(chef_run).to start_service('uwsgi')
  end
end
