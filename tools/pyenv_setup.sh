#!/usr/bin/env bash
#
# purpose:
# this script install pyenv
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

if [ -z $(get_version "python --version 2>&1") ]; then
    echo "python must be installed"
    exit 1
fi

set -e

apt-get update
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm git

yes | pip install virtualenvwrapper

PYENV=$HOME/.pyenv

if [ ! -d "$PYENV" ]; then
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    request_save_profile "export PYENV_ROOT=$PYENV\nexport PATH=\$PATH:\$PYENV_ROOT/bin\neval "$(pyenv init -)""
    source ~/.bash_profile
    
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    request_save_profile "eval "$(pyenv virtualenv-init -)""
fi

# source ~/.bashrc
# if [ -z $(get_version "pyenv -V") ]; then
#     exit 1
# fi
