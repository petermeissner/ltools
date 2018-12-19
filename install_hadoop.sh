#!/bin/bash

# virtualbox vms
# - new ubuntu/linux
# 
# - ubuntu 18.04 lts server
# 


# update
sudo apt update
sudo apt upgrade

# tools
sudo apt install ssh -y
sudo apt install rsync -y
sudo apt install net-tools -y

# Java
sudo apt install openjdk-11-jre 
sudo apt install openjdk-11-jdk openjdk-11-demo openjdk-11-doc openjdk-11-jre-headless openjdk-11-source 

# Hadoop user
adduser hadoop


# switch user and download/install hadoop
su hadoop
cd ~
wget http://mirror.softaculous.com/apache/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz 
tar -xzf hadoop-2.9.2.tar.gz
sudo mv hadoop-2.9.2 hadoop
rm hadoop-2.9.2.tar.gz


# add hadoop to path
su hadoop
cd ~
nano /home/hadoop/.profile
# add the following: PATH=/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH

# config JAVA_HOME in hadoop config
update-alternatives --display java | grep -m 1 -o -P "(/usr.*)(?=/bin)" 
# e.g.: /usr/lib/jvm/java-11-openjdk-amd64
nano ~/hadoop/etc/hadoop/hadoop-env.sh


# config hosts
# go back to sudoer user
sudo nano /etc/hosts



# On each node update ~/hadoop/etc/hadoop/core-site.xml 
# you want to set the NameNode location to node-master on port 9000:
nano ~/hadoop/etc/hadoop/core-site.xml
#    <?xml version="1.0" encoding="UTF-8"?>
#    <?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
#        <configuration>
#            <property>
#                <name>fs.default.name</name>
#                <value>hdfs://node-master:9000</value>
#            </property>
#        </configuration>






