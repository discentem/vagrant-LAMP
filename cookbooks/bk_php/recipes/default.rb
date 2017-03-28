#
# Cookbook Name:: bk_php
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

packages = %w(php5 php-pear php-mysql)

packages.each do |pkg|
  package pkg do
    action :install
  end
end

cookbook_file "/etc/php5/apache2/php.ini" do
  source "php.ini"
  mode "0644"
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
