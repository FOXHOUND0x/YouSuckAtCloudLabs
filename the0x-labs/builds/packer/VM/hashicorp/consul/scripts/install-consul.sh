#!/bin/bash

set -e 

echo "Starting Consul Installation..."

sudo yum update -y && sudo yum install -y yum-utils wget unzip
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install consul

sudo mkdir -p /etc/consul.d /opt/consul/data
sudo chown -R consul:consul /etc/consul.d /opt/consul/data

echo "Consul installation completed successfully."