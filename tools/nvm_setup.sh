#!/usr/bin/env bash
#
# purpose:
# this script install nvm
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../utils/common.sh"

root_check

set -e

apt-get update
apt-get install -y \
    build-essential \
    libssl-dev \
    wget

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

if [ -z $(get_version "nvm --version") ]; then
    exit 1
fi

nvm install 9.0.0

if [ -z $(get_version "node -v") ]; then
    exit 1
fi
