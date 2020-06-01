#!/bin/bash
set -e
xfce4-terminal -e ./main
xfce4-terminal -e ./main
echo -n "enter pid of first load gen: "
read PID1
echo -n "enter pid of second load gen: "
read PID2

echo "PID1: $PID1"
echo "PID2: $PID2"

CG1="/sys/fs/cgroup/cpu/deepdivedemo06/test1"
CG2="/sys/fs/cgroup/cpu/deepdivedemo06/test2"

sudo mkdir -p "$CG1"
sudo mkdir -p "$CG2"

echo $PID1 | sudo tee "$CG1/cgroup.procs"
echo $PID2 | sudo tee "$CG2/cgroup.procs"

echo 200 | sudo tee "$CG1/cpu.shares"
echo 100 | sudo tee "$CG2/cpu.shares"

# microseconds
echo 100000 | sudo tee "$CG1/cpu.cfs_period_us"
echo 100000 | sudo tee "$CG2/cpu.cfs_period_us"

# one core 100%
echo 100000 | sudo tee "$CG1/cpu.cfs_quota_us"
echo 100000 | sudo tee "$CG2/cpu.cfs_quota_us"
