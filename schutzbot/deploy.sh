#!/bin/bash
set -euxo pipefail

# Speed up dnf.
echo "fastestmirror=1" | sudo tee -a /etc/dnf/dnf.conf

# Install required packages.
sudo dnf -qy install ansible python3-openstackclient

# Prepare the OpenStack login credentials.
mkdir -p ~/.config/openstack
cp $OPENSTACK_CREDS ~/.config/openstack/clouds.yaml

# Move the ssh key into place.
mkdir -p ~/.ssh/
echo $SSH_CREDS | tee ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa
chmod 0700 ~/.ssh/
file ~/.ssh/id_rsa

ip addr
sleep 3600

# Run the deployment.
ansible-playbook -i localhost, deploy.yml