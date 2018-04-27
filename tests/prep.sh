#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e

apt-get update
apt-get install -y software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt-get update
apt-get install -y python3.6 python-pip

easy_install pip
pip install pyyaml

cat $THIS_DIR/orig_pend | tee /tmp/prepend_test /tmp/append_test > /dev/null
