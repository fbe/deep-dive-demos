#!/bin/bash
xfce4-terminal -e dstat
xfce4-terminal -e htop
sudo mkdir /sys/fs/cgroup/freezer/deepdive/
pidof python2 | sudo tee /sys/fs/cgroup/freezer/deepdive/cgroup.procs
pidof htop | sudo tee /sys/fs/cgroup/freezer/deepdive/cgroup.procs
echo FROZEN | sudo tee /sys/fs/cgroup/freezer/deepdive/freezer.state
echo THAWED | sudo tee /sys/fs/cgroup/freezer/deepdive/freezer.state
