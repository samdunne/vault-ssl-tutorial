#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
sudo yum install -y unzip

echo "Fetching Vault..."
cd /tmp
wget --quiet https://releases.hashicorp.com/vault/0.3.1/vault_0.3.1_linux_amd64.zip -O vault.zip

echo "Installing Vault..."
unzip vault.zip >/dev/null
sudo chmod +x vault
sudo mv vault /usr/local/bin/vault
sudo mkdir -p /etc/vault.d
sudo mkdir -p /var/lib/vault/ssl

echo "Configuring Vault..."
sudo cp /vagrant/vault/configuration.json /etc/vault.d/configuration.json

echo "Installing service..."
sudo cp /vagrant/vault/vault.init /etc/init.d/vault
sudo chmod +x /etc/init.d/vault
sudo chkconfig vault on
