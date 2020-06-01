#!/bin/bash
mkdir -p lowerdir
pushd lowerdir
tar xfv ../alpine-minirootfs-3.11.6-x86_64.tar.gz
popd
mkdir upperdir
mkdir rootfs
mkdir overlayworkdir
ip netns exec demo10 bash
# enter mount ns
sudo unshare -m bash
sudo mount -t overlay
sudo unshare -u bash
hostname testcontainer
sudo unshare -p bash
sudo mount -t overlay overlay -o lowerdir=lowerdir,upperdir=upperdir,workdir=overlay-workdir rootfs
sudo chroot rootfs /bin/sh
mount -t proc none
