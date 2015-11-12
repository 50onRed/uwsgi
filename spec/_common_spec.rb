# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'uwsgi::_common' do
  let (:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['python']['prefix_dir'] = '/usr/local'
    end.converge(described_recipe)
  end
end
