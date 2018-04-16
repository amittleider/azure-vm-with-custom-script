#!/bin/bash

set -e 

RESOURCE_GROUP="only-the-best"
VM_NAME="even-better"

# You will need to login first, but it's not scripted
# az login

# Create a resource group.
az group create --name $RESOURCE_GROUP --location westeurope

# Create a new virtual machine, this creates SSH keys if not present.
az vm create --resource-group $RESOURCE_GROUP --name $VM_NAME --image UbuntuLTS --generate-ssh-keys

# Open port 80 to allow web traffic to host.
az vm open-port --port 80 --resource-group $RESOURCE_GROUP --name $VM_NAME

# Find a list of azure images with the following command:
#az vm image list

INSTALL_DOCKER_BASE64=$( cat launch-runner.sh | base64 -w 0 )

# COMMAND=$INSTALL_DOCKER_BASE64 | base64 -d 
az vm extension set \
  --publisher Microsoft.Azure.Extensions \
  --version 2.0 \
  --name CustomScript \
  --vm-name $VM_NAME \
  --resource-group $RESOURCE_GROUP \
  --settings "{\"commandToExecute\": \"echo $INSTALL_DOCKER_BASE64 | base64 -d | bash\"}"
