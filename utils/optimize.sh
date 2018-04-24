#!/usr/bin/env bash
#
# purpose:
# this script runs general performance enhancing techniques on Ubuntu 
#

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $THIS_DIR/common.sh

root_check

# turn down swappiness
sysctl vm.swappiness=10
swapoff -a
swapon -a
cat /proc/sys/vm/swapiness

# remove indexing
apt-get remove -y apt-xapian-index

# show all startup apps (GUI convenience)
cd /etc/xdg/autostart
sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
