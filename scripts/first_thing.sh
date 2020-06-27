#!/bin/bash
# First thing to do

echo "Install Pre Reqs"

# Install X11 assumes the registration
yum install xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps libXp libXmu numactl mailx java-1.8.0-openjdk-devel lsof tree tmux -y

# check the openssl
echo "verify openssl"

openssl s_client -connect linuxconfig.org:443 -showcerts

# create directories

# create the root directory for SAS
mkdir /opt/sas

# create the sub-directories within the root directory for SAS
mkdir -p /opt/sas/sashome/
mkdir -p /opt/sas/sasconfig/
mkdir -p /opt/sas/saswork/
mkdir -p /opt/sas/sasbackup/
mkdir -p /opt/sas/sashfadd/
mkdir -p /opt/sas/junit/

#create the sub-directory for the sasdepot mount
mkdir -p /mnt/sasdepot/

# create the vmware vfabric folder
mkdir -p /etc/opt/vmware/vfabric/

#mount the sasdepot
mount /dev/xvdf1 /mnt/sasdepot/
