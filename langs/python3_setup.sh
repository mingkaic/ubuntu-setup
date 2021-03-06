#!/usr/bin/env bash
#
# purpose:
# this script install python3
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source "$THIS_DIR/../utils/common.sh"

root_check

apt-get update
apt-get install -y software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt-get update
apt-get install -y python3.6 python3-pip python3.6-dev

python3 --version;
pip3 --version;
meets_version "3.0.0" $(get_version "python3 --version 2>&1") exit 1
if [ -z $(get_version "pip3 -V") ]; then
    exit 1;
fi

cp $(which python3) $(dirname $(which python3))/python;
cp $(which pip3) $(dirname $(which pip3))/pip;
