#!/bin/bash

# Install GNS3
sudo apt update
sudo apt install -y -qq python3-pip python3-pyqt5 python3-pyqt5.qtsvg \
python3-pyqt5.qtwebsockets \
qemu qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virtinst \
wireshark xtightvncviewer apt-transport-https \
ca-certificates curl gnupg2 software-properties-common
sudo pip3 install gns3-server gns3-gui

# Install Ubridge
cd /tmp
sudo apt install -y -qq git build-essential pcaputils  libpcap-dev
git clone https://github.com/GNS3/ubridge.git
cd ubridge
sudo make install

# Fix auxiliary console issue
sudo apt intall -y -qq xterm

# Fix Wireshark permissions issue
sudo apt install -y -qq debconf-utils
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo dpkg-reconfigure wireshark-common -fnoninteractive

# Install dynamips
cd /tmp
sudo apt install -y -qq libelf-dev libpcap-dev cmake
git clone https://github.com/GNS3/dynamips.git
cd dynamips
mkdir build
cd build
cmake ..
sudo make install