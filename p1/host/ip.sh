#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit
fi

if [ $1 = "2" ]; then
    LOCAL=2
    REMOTE=1
else
    LOCAL=1
    REMOTE=2
fi

# Give IP to eth1
ip addr add 30.1.1.$LOCAL/24 dev eth1

# Keep running
tail -f /dev/null