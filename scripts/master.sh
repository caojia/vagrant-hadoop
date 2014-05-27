#!/bin/bash

cp -f /vagrant/scripts/cloudera-manager.repo /etc/yum.repos.d/
rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera


yum -y install java-1.7.0-openjdk-devel cloudera-manager-server-db cloudera-manager-server cloudera-manager-daemons

service cloudera-scm-server-db initdb
service cloudera-scm-server-db start
service cloudera-scm-server start
