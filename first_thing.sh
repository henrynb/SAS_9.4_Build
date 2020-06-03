#!/bin/bash
# First thing to do
#
# This script installs 
#
#		X11
#       Configure postfix
#       mailx
#       pre-reqs (libXp, libXmu, numactl, mailx, java-1.8.0-openjdk-devel)
#
# *****************************************************************************************
#
# update the OS. Assumes that new installation has been registered
#
# *****************************************************************************************

# *****************************************************************************************
#
# Install X11
#
# *****************************************************************************************
echo "Install X11"

# Install X11 assumes the registration
yum install xorg-x11-server-Xorg xorg-x11-xauth -y
yum xorg-x11-apps -y

# restart the sshd service
systemctl restart sshd

# backup main.cf
mv /etc/postfix/main.cf /etc/postfix/main.cf.orig
cp /home/ec2-user/main.cf /etc/postfix/main.cf

# restart postfix
systemctl restart postfix

# *****************************************************************************************
#
# Install pre-reqs
#
# *****************************************************************************************

echo "Install Pre Reqs"

# Install libXp
yum install libXp libXmu numactl mailx java-1.8.0-openjdk-devel lsof -y >> first_thing.log

echo "Install Java JRE 8"
yum install /home/ec2-user/jre-8u251-linux-x64.rpm -y

# *****************************************************************************************
#
# Verify openssl
#
# *****************************************************************************************

echo "verify openssl"

openssl s_client -connect linuxconfig.org:443 -showcerts >> first_thing.log
