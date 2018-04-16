#!/bin/bash

VSTS_TOKEN=enter-token-here
VSTS_ACCOUNT=enter-account-here

sudo apt-get update

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce

sudo groupadd docker

sudo usermod -aG docker $USER

sudo systemctl enable docker

sudo systemctl start docker

docker run \
  -d \
  -e VSTS_ACCOUNT=$VSTS_ACCOUNT \
  -e VSTS_TOKEN=$VSTS_TOKEN \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -it microsoft/vsts-agent:ubuntu-16.04-docker-17.12.0-ce \
