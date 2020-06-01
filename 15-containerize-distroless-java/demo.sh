#!/bin/bash
mkdir -p bin/
cp busybox bin/
pushd bin
	./busybox --list | while read line; do ln -s busybox $line; done;
popd
docker build -t demo15 .
docker run -ti --rm demo15
