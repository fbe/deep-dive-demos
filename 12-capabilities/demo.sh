#!/bin/bash
mkdir -p rootfs
pushd rootfs
tar xfv ../alpine-minirootfs-3.11.6-x86_64.tar.gz
popd
sudo bash -c 'getpcaps $$'
sudo chroot rootfs /bin/sh
sudo capsh --drop=cap_sys_chroot --
chroot rootfs /bin/sh
sudo capsh --drop= --
chroot rootfs /bin/sh
