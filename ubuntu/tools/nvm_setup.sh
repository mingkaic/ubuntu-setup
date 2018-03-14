#!/usr/bin/env bash

apt-get update
apt-get install build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
source ~/.profile

if [ -z $(get_version "nvm --version") ]; then
    exit 1
fi
