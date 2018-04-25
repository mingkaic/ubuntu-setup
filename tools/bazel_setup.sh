#!/usr/bin/env bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

set -e

INSTALLER=bazel-0.12.0-installer-linux-x86_64.sh
TMP_INSTALLER=/tmp/$INSTALLER

# dependencies
apt-get update
apt-get install -y \
    pkg-config \
    zip \
    g++ \
    zlib1g-dev \
    unzip \
    wget \
    python
wget https://github.com/bazelbuild/bazel/releases/download/0.12.0/$INSTALLER -O $TMP_INSTALLER

chmod +x $TMP_INSTALLER
$TMP_INSTALLER

if [ -z $(get_version "bazel version") ]; then
    exit 1
fi
