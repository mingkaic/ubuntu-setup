#!/usr/bin/env bash

apt-get remove docker docker-engine docker.io

# install docker engine

apt-get update

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo apt-key add -

DOCKER_VERIFY=$(apt-key fingerprint | grep docker)
if [ -z "$DOCKER_VERIFY" ]; then
    echo "FAILED to retrieve valid docker key"
    exit 1
fi

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install -y docker-ce

# configure docker as root

if [ -n "$USER" ]; then
    usermod -aG docker "$USER"
fi

# install docker machine

curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
install /tmp/docker-machine /usr/local/bin/docker-machine

if [ -z $(get_version "docker version") ]; then
    exit 1
fi

