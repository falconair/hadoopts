# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    #config.ssh.private_key_path = "~/.ssh/id_rsa"
    #config.ssh.forward_agent = true


  #=========file server=========
  #Caches apt packages so each package only needs to be odwnloaded once
  #Serves files, such as various tar files from /var/www/html
  #config.vm.define "fileserver" do |node|
  #  node.vm.network "private_network", ip: "172.28.128.2"
  #  node.vm.hostname="fileserver"
  #  node.vm.provision "shell", path: "bootstrap-fileserver.sh"
  #end

  #=========Zookeeper machines=========
  config.vm.define "zk1" do |node|
    node.vm.network "private_network", ip: "172.28.128.3"
    node.vm.hostname="zk1"
    node.vm.provision "shell", path: "bootstrap-zookeeper.sh"
    node.vm.provision "shell", inline: "echo 1 > /etc/zookeeper/conf/myid"
  end

  config.vm.define "zk2" do |node|
    node.vm.network "private_network", ip: "172.28.128.4"
    node.vm.hostname="zk2"
    node.vm.provision "shell", path: "bootstrap-zookeeper.sh"
    node.vm.provision "shell", inline: "echo 2 > /etc/zookeeper/conf/myid"
  end

  config.vm.define "zk3" do |node|
    node.vm.network "private_network", ip: "172.28.128.5"
    node.vm.hostname="zk3"
    node.vm.provision "shell", path: "bootstrap-zookeeper.sh"
    node.vm.provision "shell", inline: "echo 3 > /etc/zookeeper/conf/myid"
  end

  #=========Kafka machines=========
  config.vm.define "kafka1" do |node|
    node.vm.provider "virtualbox" do |v| v.memory = 2048 end
    node.vm.network "private_network", ip: "172.28.128.7"
    node.vm.hostname="kafka1"
    node.vm.provision "shell", path: "bootstrap-kafka.sh"
    node.vm.provision "shell", inline: "echo broker.id=1 >> /opt/kafka/config/server.properties && sudo systemctl restart kafka"
  end

  config.vm.define "kafka2" do |node|
    node.vm.provider "virtualbox" do |v| v.memory = 2048 end
    node.vm.network "private_network", ip: "172.28.128.8"
    node.vm.hostname="kafka2"
    node.vm.provision "shell", path: "bootstrap-kafka.sh"
    node.vm.provision "shell", inline: "echo broker.id=2 >> /opt/kafka/config/server.properties && sudo systemctl restart kafka"
  end

  config.vm.define "kafka3" do |node|
    node.vm.provider "virtualbox" do |v| v.memory = 2048 end
    node.vm.network "private_network", ip: "172.28.128.9"
    node.vm.hostname="kafka3"
    node.vm.provision "shell", path: "bootstrap-kafka.sh"
    node.vm.provision "shell", inline: "echo broker.id=3 >> /opt/kafka/config/server.properties && sudo systemctl restart kafka"
  end

  #=========test machine=========
  config.vm.define "test", autostart: false do |node|
    node.vm.network "private_network", ip: "172.28.128.6"
    node.vm.hostname="test"
    node.vm.provision "shell", path: "bootstrap-common.sh"
  end


end
