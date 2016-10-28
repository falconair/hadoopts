# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|


  #=========Apt repository cache machines=========
  #Caches apt packages so each package only needs to be odwnloaded once
  #Serves files, such as various tar files from /var/www/html
  config.vm.define "fileserver" do |node|
    node.vm.box = "ubuntu/xenial64"
    node.vm.network "private_network", ip: "172.28.128.2"
    node.vm.provision "shell", inline: "sudo apt -y install apt-cacher-ng && apt -y install nginx-light"
  end

  #=========Zookeeper machines=========
  config.vm.define "zk1" do |node|
    node.vm.box = "ubuntu/xenial64"
    node.vm.network "private_network", ip: "172.28.128.3"
    node.vm.provision "shell", path: "bootstrap-common.sh"
  end

  config.vm.define "zk2" do |node|
    node.vm.box = "ubuntu/xenial64"
    node.vm.network "private_network", ip: "172.28.128.4"
    node.vm.provision "shell", path: "bootstrap-common.sh"
  end

  config.vm.define "zk3" do |node|
    node.vm.box = "ubuntu/xenial64"
    node.vm.network "private_network", ip: "172.28.128.5"
    node.vm.provision "shell", path: "bootstrap-common.sh"
  end

  #=========test machine=========
  config.vm.define "test", autostart: false do |node|
    node.vm.box = "ubuntu/xenial64"
    node.vm.network "private_network", ip: "172.28.128.6"
    node.vm.provision "shell", path: "bootstrap-common.sh"
  end


end
