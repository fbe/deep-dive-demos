#!/bin/bash
sudo ip netns add demo10
sudo ip netns list
sudo ip link add veth0 type veth peer name veth1
ip link list
sudo ip link set veth1 netns demo10
sudo ip netns exec demo10 ip link list
ip link list

sudo ip addr add 192.168.42.1/24 dev veth0
sudo ip netns exec demo10 ip addr add 192.168.42.2/24 dev veth1

sudo ip netns exec ip link set dev veth1 up
sudo ip link set dev veth0 up

ping 192.168.42.2
