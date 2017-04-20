#
# Cookbook Name:: bk_mysql
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

mysql_client 'default' do
  action :create
end

mysql_service "vl" do
  initial_root_password node['bk_mysql']['initial_root_password']
  action [:create, :start]
end
