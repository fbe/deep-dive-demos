#!/bin/bash
go build main.go
docker build -t demo13 .
docker run -ti --rm demo13
