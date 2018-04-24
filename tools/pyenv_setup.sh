#!/usr/bin/env bash
#
# purpose:
# this script install pyenv
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
source $THIS_DIR/../utils/common.sh

root_check

if [ -z $(get_version "python -V") ]; then
    echo "python must be installed"
    exit 1
fi

yes | pip install virtualenvwrapper

PYENV=~/.pyenv

if [ ! -d "$PYENV" ]; then
    git clone https://github.com/pyenv/pyenv.git $PYENV
    request_save_profile "export PYENV_ROOT=$PYENV\nexport PATH=\$PATH:\$PYENV_ROOT/bin"

    source ~/.bashrc

    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    request_save_profile "eval "$(pyenv init -)""
fi

source ~/.bashrc
if [ -z $(get_version "python -V") ]; then
    exit 1
fi
