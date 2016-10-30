#!/bin/bash

sudo apt -y install openjdk-8-jdk-headless

#===== zookeeper setup (http://www.linux-admins.net/2015/07/deploying-apache-kafka-and-apache.html) =====
sudo apt -y install zookeeperd
#sudo mkdir -p /var/zookeeper/data

#default values
echo "#These values were populated by bootstrap-common.sh vagrant script" > /etc/zookeeper/conf/zoo.cfg
echo "tickTime=2000" >> /etc/zookeeper/conf/zoo.cfg
echo "initLimit=10" >> /etc/zookeeper/conf/zoo.cfg
echo "syncLimit=5" >> /etc/zookeeper/conf/zoo.cfg
echo "clientPort=2181" >> /etc/zookeeper/conf/zoo.cfg
echo "dataDir=/var/lib/zookeeper" >> /etc/zookeeper/conf/zoo.cfg

#echo "dataDir=/var/zookeeper/data" >> /etc/zookeeper/conf/zoo.cfg
echo "server.1=172.28.128.3:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.2=172.28.128.4:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.3=172.28.128.5:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
sudo systemctl restart zookeeper