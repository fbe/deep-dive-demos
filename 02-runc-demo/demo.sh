#!/bin/bash
set -e
mkdir -p rootfs
pushd rootfs
tar xfv ../alpine-minirootfs-3.11.6-x86_64.tar.gz
popd

runc spec

sudo runc run test
