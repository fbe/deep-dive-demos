#!/bin/bash
set -e
strace -f ls
strace -f -e trace=memory ls
strace -f -e trace=network ls
strace -f -e trace=file ls 
strace -f -e trace=file ls -la
strace -f -c ls -la
