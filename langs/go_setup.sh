#!/usr/bin/env bash
#
# purpose:
# this script install golang
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

apt install -y software-properties-common
add-apt-repository -y ppa:hnakamur/golang-1.10
apt update
apt install -y golang-go golang-1.10-doc

mkdir -p $HOME/Developer/go/bin
mkdir -p $HOME/Developer/go/pkg
mkdir -p $HOME/Developer/go/src

request_save_profile "export GOPATH=\$HOME/Developer/go\nexport PATH=\$PATH:\$GOPATH/bin"

source ~/.bashrc
if [ -z $(get_version "go version") ]; then
    exit 1
fi

add-apt-repository -y ppa:masterminds/glide
apt-get update
apt-get install -y glide
