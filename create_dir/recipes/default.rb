#
# Cookbook:: create_dir
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
directory '/chef_created' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

