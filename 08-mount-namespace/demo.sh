#!/bin/bash
clear
sudo mkdir -p /mnt/etc/
sudo unshare -m bash -c 'mount --bind /etc /mnt/etc && ls /mnt/etc && echo "mount | grep etc in ns: " && mount | grep etc'
echo "Contents of /mnt/etc/ outside ns:"
ls /mnt/etc/
echo "mount | grep etc outside ns"
mount | grep etc
