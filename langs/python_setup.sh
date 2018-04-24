#!/usr/bin/env bash
#
# purpose:
# this script install python
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

apt-get install -y \
    git make \
    build-essential \
    libssl-dev \
    python-pip \
	python-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev

easy_install pip
yes | pip install --upgrade pip
