#!/bin/bash

apt-get update && apt-get upgrade -y
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

systemctl enable docker
systemctl start docker

docker pull flamingspaz/checkout
docker run -d -e PORT=${port} -e BASE_URL=${base_url} flamingspaz/checkout
