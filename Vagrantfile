# -*- mode: ruby -*-
# vi: set ft=ruby :
#

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.ssh.forward_agent = true
  config.vm.provision "shell", path: "scripts/install_hosts.sh"
  config.vm.provision "shell", inline: "service iptables stop"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.define "hadoop-master" do |master|
    master.vm.network :private_network, ip: "10.30.3.51"
    master.vm.network "forwarded_port", guest: 7180, host: 7180
    master.vm.hostname = "vm-cluster-node1"
    master.vm.provision :shell, path: "scripts/master.sh"
  end

  (1..2).each do |i|
    config.vm.define "hadoop-slave#{i}" do |slave|
      slave.vm.network :private_network, ip: "10.30.3.#{51+i}"
      slave.vm.hostname = "vm-cluster-node#{i+1}"
    end
  end

  config.vm.define "hadoop-client" do |client|
    client.vm.network :private_network, ip: "10.30.3.50"
    client.vm.hostname = "vm-cluster-client"
  end

end
