#
# Cookbook Name:: bk_init
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

run_list = []

run_list += [
  'apt',
  'bk_apache',
  'bk_mysql'
]

run_list.uniq.each do |recipe|
  include_recipe recipe
end
