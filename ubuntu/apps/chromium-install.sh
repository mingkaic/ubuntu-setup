#!/usr/bin/env bash
#
# purpose:
# this script install chromium browser
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $THIS_DIR/../utils/common.sh

root_check

apt-get update
apt-get install -y chromium-browser
