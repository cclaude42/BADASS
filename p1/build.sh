#!/bin/bash
# A script to build the images for the P1, P2 and P3

docker build -t host_img ./host
docker build -t router_img ./router
