#!/bin/bash
set -euxo pipefail

# Speed up dnf.
echo "fastestmirror=1" | sudo tee -a /etc/dnf/dnf.conf

# Install required packages.
sudo dnf -qy install ansible python3-openstackclient

# Prepare the OpenStack login credentials.
mkdir -p ~/.config/openstack
cp $OPENSTACK_CREDS ~/.config/openstack/clouds.yaml

# Run the deployment.
ansible-playbook -i localhost, deploy.yml