#
# Cookbook Name:: server_setup
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end

cookbook_file '/etc/nginx/sites-available/default' do
  source 'nginx.txt'
  mode "0644"
end

cookbook_file '/etc/init/virtualized.conf' do
  source 'gunicorn.txt'
end
