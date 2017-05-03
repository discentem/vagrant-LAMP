#
# Cookbook Name:: bk_mysql
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


mysql_service_name = node['bk_mysql']['mysql_service']
mysql_service mysql_service_name do
  run_user node['bk_mysql']['run_user']
  initial_root_password node['bk_mysql']['initial_root_password']
  action [:create, :start]
end
