#!/usr/bin/env bash
#
# purpose:
# this script install minikube and dependencies
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

set -e

INSTALL_PATH=/usr/local/bin/

# install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl"

chmod +x kubectl

mv kubectl $INSTALL_PATH

# install virtualbox
apt-get update
apt-get install -y virtualbox

# install minikube
curl -Lo minikube "https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-linux-amd64"

chmod +x minikube

mv minikube $INSTALL_PATH

if [ -z $(get_version "kubectl version -c") ]; then
    exit 1
fi


if [ -z $(get_version "minikube version") ]; then
    exit 1
fi
