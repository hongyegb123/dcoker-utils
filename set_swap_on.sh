#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/294600/i-cant-enable-swap-space-on-centos-7
# with the fallocate command created file may swap failed, using dd instead.
# # swapon /swapfile
# swapon: /swapfile: swapon failed: Invalid argument
# The problem with fallocate(1) is that it uses filesystem ioctls to make the allocation fast and effective,
# the disadvantage is that it does not physically allocate the space but swapon(2) syscall requires a real space. 
# Reference : https://bugzilla.redhat.com/show_bug.cgi?id=1129205

if [[ ! -f  /swapfile ]]; then
  # sudo fallocate -l 2G /swapfile
  sudo dd if=/dev/zero of=/swapfile count=2048 bs=1MiB
  sudo chmod 600 /swapfile
  mkswap /swapfile
fi

# swapon
swapon --show

swapon /swapfile

swapon --show

# set swappiness
cat /proc/sys/vm/swappiness

sysctl vm.swappiness=60

cat /proc/sys/vm/swappiness
