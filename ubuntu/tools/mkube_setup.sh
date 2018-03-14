#!/usr/bin/env bash

INSTALL_PATH=/usr/local/bin/

# install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl"

chmod +x kubectl

mv kubectl $INSTALL_PATH

# install virtualbox

apt-get install -y virtualbox

# install minikube
curl -Lo minikube "https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-linux-amd64"

chmod +x minikube

mv minikube $INSTALL_PATH
