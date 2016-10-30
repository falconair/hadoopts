#!/bin/bash

sudo apt -y install openjdk-8-jdk-headless

#===== kafka setup (https://www.digitalocean.com/community/tutorials/how-to-install-apache-kafka-on-ubuntu-14-04) =====
#useradd kafka

cd /tmp
wget --quiet http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz

sudo mkdir -p /opt/kafka && cd /opt/kafka
sudo chown -R $(whoami)  .
mkdir logs
tar -xvzf /tmp/kafka*.tgz --strip 1

#default values for zookeeper config
echo "#These values were populated by bootstrap-kafka.sh vagrant script" > config/server.properties
echo "num.network.threads=3" >> config/server.properties
echo "num.io.threads=8" >> config/server.properties
echo "socket.send.buffer.bytes=102400" >> config/server.properties
echo "socket.receive.buffer.bytes=102400" >> config/server.properties
echo "socket.request.max.bytes=104857600" >> config/server.properties
echo "log.dirs=/tmp/kafka-logs" >> config/server.properties
echo "num.partitions=1" >> config/server.properties
echo "num.recovery.threads.per.data.dir=1" >> config/server.properties
echo "log.retention.hours=168" >> config/server.properties
echo "log.segment.bytes=1073741824" >> config/server.properties
echo "log.retention.check.interval.ms=300000" >> config/server.properties
echo "zookeeper.connect=172.28.128.3:2181,172.28.128.4:2181,172.28.128.5:2181" >> config/server.properties
echo "zookeeper.connection.timeout.ms=6000" >> config/server.properties

#echo "broker.id=0" >> config/server.properties


#systemd service file
sudo echo "[Unit]" >> /etc/systemd/system/kafka.service
sudo echo "Description=Apache Kafka server (broker)" >> /etc/systemd/system/kafka.service
sudo echo "Documentation=http://kafka.apache.org/documentation.html" >> /etc/systemd/system/kafka.service
sudo echo "Requires=network.target remote-fs.target " >> /etc/systemd/system/kafka.service
sudo echo "After=network.target remote-fs.target kafka-zookeeper.service" >> /etc/systemd/system/kafka.service

sudo echo "[Service]" >> /etc/systemd/system/kafka.service
Type=simple
#sudo echo "User=kafka" >> /etc/systemd/system/kafka.service
#sudo echo "Group=kafka" >> /etc/systemd/system/kafka.service
#sudo echo "Environment=JAVA_HOME=/opt/mesosphere/active/java/usr/java" >> /etc/systemd/system/kafka.service
sudo echo "ExecStart=/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties" >> /etc/systemd/system/kafka.service
sudo echo "ExecStop=/opt/kafka/bin/kafka-server-stop.sh" >> /etc/systemd/system/kafka.service

sudo echo "[Install]" >> /etc/systemd/system/kafka.service
sudo echo "WantedBy=multi-user.target" >> /etc/systemd/system/kafka.service

sudo systemctl enable kafka