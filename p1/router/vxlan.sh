#!/bin/bash
# A script to set up the VXLAN of the routers in P2

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit
fi

if [ $1 = "1" ]; then
    LOCAL=1
    REMOTE=2
elif [ $1 = "2" ]; then
    LOCAL=2
    REMOTE=1
else
    exit
fi

# Start FRR
/usr/lib/frr/docker-start &

# Create bridge
ip link add br0 type bridge
ip link set dev br0 up

# Give IP to eth0
ip addr add 10.1.1.$LOCAL/24 dev eth0

# Create VXLAN
ip link add name vxlan10 type vxlan id 10 dev eth0 local 10.1.1.$LOCAL remote 10.1.1.$REMOTE dstport 4789
ip addr add 20.1.1.$LOCAL/24 dev vxlan10

# Add to bridge
brctl addif br0 eth1
brctl addif br0 vxlan10

# Up bridge
ip link set dev vxlan10 up

# Keep running
tail -f /dev/null