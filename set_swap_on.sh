#!/usr/bin/env bash

if [[ ! -f  /swapfile ]]; then
  sudo fallocate -l 2G /swapfile
  sudo chmod 600 /swapfile
  mkswap /swapfile
fi

# swapon
swapon --show

swapon /swapfile

swapon --show

# set swappiness
cat /proc/sys/vm/swappiness

sysctl vm.swappiness=50

cat /proc/sys/vm/swappiness
