#!/usr/bin/env bash
#
# purpose:
# this script install python
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../utils/common.sh"

root_check

apt-get update
apt-get install -y python-dev python-pip

if [ -z $(get_version "python --version 2>&1") ]; then
    exit 1
fi

if [ -z $(get_version "pip -V") ]; then
    exit 1
fi
