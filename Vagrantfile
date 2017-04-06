# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "hashicorp/precise64"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "hyperv" do |hv|
    hv.memory = "2048"
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "bk_init"
    chef.node_name = "lamp_stack"
  end
end
