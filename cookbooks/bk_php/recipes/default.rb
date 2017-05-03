#
# Cookbook Name:: bk_php
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

node['bk_php']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/apache2/mods-enabled/php5.conf" do
  source "php5.erb"
  mode "0644"
  notifies :restart, "service[apache2]"
end

template "/etc/php5/apache2/php.ini" do
  source "php.ini.erb"
  mode "0644"
  variables(
    :mysql_service_name => node['bk_mysql']['mysql_service'],
  )
  notifies :restart, "service[apache2]"
end

execute "chownlog" do
  command "chown www-data /var/log/php"
  action :nothing
end

directory "/var/log/php" do
  action :create
  notifies :run, "execute[chownlog]"
end
