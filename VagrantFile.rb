# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080


  config.vm.provider "virtualbox" do |vm|
    vm.name = "vagrant-LAMP"
    vm.memory = "2048"
  end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "bk_init"
    chef.node_name = "vagrant-LAMP"
  end
end
