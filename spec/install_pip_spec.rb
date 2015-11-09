# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'uwsgi::install_pip' do
  let (:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['python']['prefix_dir'] = '/usr/local'
    end.converge(described_recipe)
  end

  it 'includes recipe `uwsgi::_common_install`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('uwsgi::_common_install')
  end

  it 'includes recipe `python`' do
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('python')
  end

  it 'installs uwsgi from `lts` source' do
    chef_run.node.set['uwsgi']['version'] = 'lts'
    chef_run.converge(described_recipe)
    expect(chef_run).to install_python_pip('uwsgi').with(
      package_name: 'http://projects.unbit.it/downloads/uwsgi-lts.tar.gz'
    )
  end

  it 'installs uwsgi' do
    chef_run.converge(described_recipe)
    expect(chef_run).to install_python_pip('uwsgi')
  end
end
