#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

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
