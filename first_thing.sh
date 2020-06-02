#!/bin/bash
# First thing to do
#
# This script installs 
#
#		X11
#       postfix
#       mailx
#       pre-reqs (libXp, libXmu, numactl)
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

# restart the sshd service
systemctl restart sshd

# enable the repos
subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

# install the apps
yum install xorg-x11-apps -y

# *****************************************************************************************
#
# Install Mail Server and Client
#
# *****************************************************************************************

echo "Install Mail Server"

# install the mail server
dnf install postfix -y >> first_thing.log

# enable the postfix server
systemctl enable postfix

# start the postfix server
systemctl start postfix

# get the status of the postfix server
systemctl status postfix >> first_thing.log

# install the mailx client
dnf install mailx -y  >> first_thing.log

# backup main.cf
mv /etc/postfix/main.cf /etc/postfix/main.cf.old
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
dnf install libXp -y >> first_thing.log

# Install libXmu
dnf install libXmu -y >> first_thing.log

# Install numactl
dnf install numactl -y  >> first_thing.log

# *****************************************************************************************
#
# Install pre-reqs
#
# *****************************************************************************************
echo "Install Java openjdk"
dnf install java-1.8.0-openjdk-devel -y

echo "Install Java JRE 8"
dnf install /home/ec2-user/jre-8u251-linux-x64.rpm -y



# *****************************************************************************************
#
# Verify openssl
#
# *****************************************************************************************

echo "verify openssl"

openssl s_client -connect linuxconfig.org:443 --showcerts >> first_thing.log
