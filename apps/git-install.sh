#!/usr/bin/env bash
#
# purpose:
# this script install git
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $THIS_DIR/../utils/common.sh

root_check

apt install -y git-all
