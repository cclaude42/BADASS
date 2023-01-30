#!/bin/bash
# A script to set up the IPs of the host machines in P2 and P3

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit
fi

if [ $1 = "1" ]; then
    N=1
elif [ $1 = "2" ]; then
    N=2
elif [ $1 = "3" ]; then
    N=3
else
    exit
fi

# Give IP to eth1
ip addr add 30.1.1.$N/24 dev eth1

# Keep running
tail -f /dev/null