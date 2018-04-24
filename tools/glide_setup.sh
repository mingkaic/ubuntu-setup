#!/usr/bin/env bash
#
# purpose:
# this script install glide for golang
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

if [ -z $(get_version "go version") ]; then
    echo "golang must be installed"
    exit 1
fi

set -e

# install glide as well
add-apt-repository -y ppa:masterminds/glide
apt-get update
apt-get install -y glide

if [ -z $(get_version "glide -v") ]; then
    exit 1
fi
