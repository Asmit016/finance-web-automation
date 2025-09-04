# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # CentOS Stream 9 ARM base box
  config.vm.box = "bandit145/centos_stream9_arm"
  config.vm.hostname = "finance-webserver"

  # Network: Access site at http://192.168.56.28
  config.vm.network "private_network", ip: "192.168.56.28"

  # VMware provider settings
  config.vm.provider "vmware_desktop" do |v|
    v.gui = true
    v.memory = 1024
    v.cpus = 2
  end

  # Provisioning script
  config.vm.provision "shell", path: "provision.sh"
end
