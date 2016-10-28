#!/bin/bash
echo 'Acquire::http::Proxy "http://172.28.128.2:3142";' > /etc/apt/apt.conf.d/02proxy

#sudo apt -y install python-minimal
sudo apt -y install openjdk-8-jdk-headless

#===== zookeeper setup =====
sudo apt -y install zookeeperd
echo "server.1=172.28.128.3:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.2=172.28.128.4:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.3=172.28.128.5:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
sudo systemctl restart zookeeper