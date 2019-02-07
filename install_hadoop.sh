#!/bin/bash

# virtualbox vms
# ----------------------------------------------------------------------------------
# source: https://www.youtube.com/watch?v=8V4Ez4NUHAk
# - new ubuntu/linux
# - make host only network controller in global options of virtual box 
#   (http://debuggingcode.com/blogs/windows/14/how-to-assign-static-ip-in-virtual-machine-in-virtualbox)
# - BEFORE INSTALLATION!: enable two network devices 
#   (1) NAT
#   (2) Host-Only-Adapter
# - ubuntu 18.04 lts server
# 


# static ip for guest systems ubuntu 18.04 / network
# ----------------------------------------------------------------------------------
# source: https://www.youtube.com/watch?v=Sg9ij3IAKDE
# source: https://www.virtualbox.org/manual/ch07.html
# source: https://websiteforstudents.com/configure-static-ip-addresses-on-ubuntu-18-04-beta/
# 
cd /etc/netplan/
# cp ... .yaml to conf.yaml
# sudo nano conf.yaml
#
# - add following content to file
# - leave rest as-is
# - use ip addresses appropriate to what is set in global options of virtualbox host 
#   only network controller
#
## content ##
# network:
#   ethernets:
#     enp0s08:
#       adresses: [192.168.90.101/24]
#       gateway4: 192.168.90.1
#       dhcp4: false


# when vm is running
# - clone it and change the follwoing line in each clusters config.yaml
#       adresses: [192.168.90.101/24]
#       adresses: [192.168.90.102/24]
#       adresses: [192.168.90.103/24]
# 
# - rename each host like this 
# sudo hostnamectl set-hostname cl1
# sudo hostnamectl set-hostname cl2
# sudo hostnamectl set-hostname cl3
# 
# - edit and add /etc/hosts on all guests 
#
# # vm cluster
# 192.168.90.101 cl1
# 192.168.90.102 cl2
# 192.168.90.103 cl3





# ubuntu server config
# ----------------------------------------------------------------------------------

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






