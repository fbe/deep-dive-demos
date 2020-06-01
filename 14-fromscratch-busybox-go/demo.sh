#!/bin/bash
./busybox
mkdir -p bin/
cp busybox bin/
pushd bin
	./busybox --list | while read line; do ln -s busybox $line; done;
popd

go build main.go
docker build -t demo14 .
docker run -ti --rm demo14
docker run -ti --rm --entrypoint=/bin/sh demo14
