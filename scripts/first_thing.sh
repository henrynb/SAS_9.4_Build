#!/bin/bash
# First thing to do

echo "Install Pre Reqs"

# Install X11 assumes the registration
yum install xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps libXp libXmu numactl mailx java-1.8.0-openjdk-devel lsof tree tmux -y

# Install jre-8u251-linux-x64 assumes path /root/git/SAS_9.4_Build/
yum install /root/git/SAS_9.4_Build/downloads/jre-8u251-linux-x64.rpm -y

# check the openssl
echo "verify openssl"

openssl s_client -connect linuxconfig.org:443 -showcerts

# create the sub-directories within the root directory for SAS
mkdir -p /opt/sas/sashome/
mkdir -p /opt/sas/sasconfig/
mkdir -p /opt/sas/saswork/
mkdir -p /opt/sas/sasbackup/
mkdir -p /opt/sas/sashfadd/
mkdir -p /opt/sas/junit/

# copy junit to /opt/sas/junit/; assumes path /root/git/SAS_9.4_Build/downloads/junit/
cp /root/git/SAS_9.4_Build/downloads/junit/junit-4.10.jar /opt/sas/junit/junit-4.10.jar

#create the sub-directory for the sasdepot mount
mkdir -p /mnt/sasdepot/

# create the vmware vfabric folder
#mkdir -p /etc/opt/vmware/vfabric/

#mount the sasdepot
# at the end of this script, you need to re-boot. this temp mount is lost
mount /dev/xvdf1 /mnt/sasdepot/

# Modify limits.conf
# created backup and removes end of line comment /etc/security/limits.?
sed -i.orig  "/# End of file/d" /etc/security/limits.conf

#cp /etc/security/limits.conf /etc/security/limits.conf.orig
echo "*                soft    nofile          20480" >> /etc/security/limits.conf
echo "*                hard    nofile          65535" >> /etc/security/limits.conf
echo "*                soft    nproc           20480" >> /etc/security/limits.conf
echo "*                hard    nproc           65535" >> /etc/security/limits.conf
echo "# End of file" >> /etc/security/limits.conf


# Modify sshd_config
# location /etc/ssh/

#Change '#PermitRootLogin yes' To PermitRootLogin no and create the backup orig
sed -i.orig "s/#PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config

#Change '#PasswordAuthentication yes' To  'PasswordAuthentication yes'
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/" /etc/ssh/sshd_config

#Change 'PasswordAuthentication no' To  '#PasswordAuthentication no'
sed -i "s/PasswordAuthentication no/#PasswordAuthentication no/" /etc/ssh/sshd_config

# restart sshd
systemctl restart sshd


