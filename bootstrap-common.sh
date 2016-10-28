#!/bin/bash
echo 'Acquire::http { Proxy "http:/172.28.128.2:3142"; };' > /etc/apt/apt.conf.d/02proxy

#sudo apt -y install python-minimal
sudo apt -y install openjdk-8-jdk-headless
