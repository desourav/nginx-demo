#!/bin/sh
# Argument 1 - image name
# Argument 2 - container name
# Usage `sh deploy.sh centos myweb`

image=$1
container=$2

PATH=$PATH:/var/root/Library/Python/2.7/bin/
ansible --version
if [ $? -eq 0 ]; then
	echo "Ansible seems to be installed just fine...."
else 
	echo "Ansible not installed properly"
	exit 1
fi

# Create a back up of the base_vars.yml
cp base_vars.yml.orig base_vars.yml

# Replace with image and container name
sed -i -e "s/@image@/${image}/g" base_vars.yml
sed -i -e "s/@container@/${container}/g" base_vars.yml

echo "Image Name - $1"
echo "Container Name - $2"

# Run the playbook
ansible-playbook base.yaml

# Remove the base_var.yml
rm base_vars.yml
