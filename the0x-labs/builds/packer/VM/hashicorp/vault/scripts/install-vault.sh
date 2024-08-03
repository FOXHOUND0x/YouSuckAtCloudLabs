#!/bin/bash

set -e

echo "Starting Vault installation..."

sudo yum update -y && sudo yum install -y yum-utils wget unzip
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install vault

sudo mkdir -p /etc/vault.d /opt/vault/data
sudo chown -R vault:vault /etc/vault.d /opt/vault/data

echo "Vault installation completed successfully."