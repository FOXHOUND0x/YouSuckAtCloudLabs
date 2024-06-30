#!/bin/bash

set -e

echo "Starting Vault installation..."

wait_for_apt_lock() {
    while sudo fuser /var/lib/dpkg/lock > /dev/null 2>&1 || \
          sudo fuser /var/lib/apt/lists/lock > /dev/null 2>&1 || \
          sudo fuser /var/cache/apt/archives/lock > /dev/null 2>&1; do
        echo "Waiting for other apt/dpkg processes to complete..."
        sleep 2
    done
}
wait_for_apt_lock

sudo apt-get update -y
wait_for_apt_lock
sudo apt-get install -y software-properties-common wget unzip

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

wait_for_apt_lock

sudo apt-get update -y
wait_for_apt_lock
sudo apt-get install -y vault

sudo mkdir -p /etc/vault.d /opt/vault/data
sudo chown -R vault:vault /etc/vault.d /opt/vault/data

sudo mv /tmp/vault.hcl /etc/vault.d/vault.hcl
sudo mv /tmp/vault.service /etc/systemd/system/vault.service

echo "Vault installation completed successfully."
