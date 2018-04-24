#!/usr/bin/env bash
#
# purpose:
# this script installs open ssh server
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $THIS_DIR/../utils/common.sh

root_check

apt-get install -y openssh-server
