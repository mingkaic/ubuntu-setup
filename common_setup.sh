#!/usr/bin/env bash
#
# purpose:
# this script performs common setup on most ubuntu systems
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/utils/common.sh

root_check

set -e

# apt installer
apt-get update
apt-get -qq update
apt-get autoremove -y;
apt-get clean;
apt-get install -y \
    apt-transport-https \
	autoconf \
	automake \
	build-essential \
    ca-certificates \
    curl \
	git \
	nfs-common \
	libssl-dev \
	libssl1.0.0 \
	libxml2-dev \
	libxslt-dev \
	software-properties-common \
	wget \
	unzip \
	zip
apt-get install -y libtool

# custom action
pushd /lib/x86_64-linux-gnu
ln -s libssl.so.1.0.0 libssl.so.10
ln -s libcrypto.so.1.0.0 libcrypto.so.10
popd
