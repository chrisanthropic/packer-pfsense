# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.vm.box = "cmad/pfsense"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.network "private_network", ip: "10.0.1.10", auto_config: false, virtualbox__intnet: true
  config.vm.guest = :freebsd

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true   
  end
  
  config.vm.provider "vmware_workstation" do |vmware|
    vmware.gui = true
  end

end