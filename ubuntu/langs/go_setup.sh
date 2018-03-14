#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/utils.sh

GO_TAR=go1.10.linux-amd64.tar.gz
INSTALL_PATH=/usr/local

wget https://dl.google.com/go/$GO_TAR
tar -C $INSTALL_PATH -xzf $GO_TAR

GOROOT=$INSTALL_PATH/go
GOPATH=$HOME/go

# save these environment variables to .bashrc
add_env_var GOROOT $GOROOT
add_env_var GOPATH $GOPATH
add_PATH "\$GOROOT"
add_PATH "\$GOPATH"

source ~/.bashrc
if [ -z $(get_version "go version") ]; then
    exit 1
fi

# install glide as well
curl http://glide.sh/get | sh
