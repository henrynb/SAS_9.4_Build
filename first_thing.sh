#!/bin/bash
# First thing to do

echo "Install X11"

# Install X11 assumes the registration
yum install xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps -y

echo "Install Pre Reqs"

# Install libXp
yum install libXp libXmu numactl mailx java-1.8.0-openjdk-devel lsof -y

# check the openssl
echo "verify openssl"

openssl s_client -connect linuxconfig.org:443 -showcerts
