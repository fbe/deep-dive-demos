#!/bin/bash
# ProcFS
cat /proc/$$/status
# SysFS
pushd /sys/fs/ext4/sda1/
	for i in *; do echo "$i: $(cat $i)"; done;
popd
