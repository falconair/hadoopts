#!/bin/bash

sudo apt -y install apt-cacher-ng
sudo apt -y install nginx-light

#Cache often used files to the file server
sudo chmod -R g+w /var/www/html
mkdir -p /var/www/html/filecache
cd /var/www/html/filecache


#wget --quiet http://mirror.cc.columbia.edu/pub/software/apache/zookeeper/current/zookeeper-3.4.9.tar.gz
wget --quiet http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz
