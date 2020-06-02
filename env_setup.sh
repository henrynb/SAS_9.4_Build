#!/bin/bash
# Initialise system for SAS 9.4 Install

# ****************************************************************************************
#
# Create users
#
# ****************************************************************************************

# Create directories

# Create the directory to mount the sas depot volume
mkdir /mnt/sasdepot

# create the root directory sas SAS 9.4 Deployment RHEL 7 HNB OS
mkdir /opt/sas

#create the directory for sasdepot. /opt/sas/sasdepot is the local sasdepot copy
mkdir /opt/sas/sasdepot

# create the sashome directory. sashome is the default for the sas binaries
mkdir /opt/sas/sashome

# create the sasconfig directory. sasconfig contains sas configuration
mkdir /opt/sas/sasconfig

# create the sasbackup directory. sas backup is used by the deployment backup and restore process
mkdir /opt/sas/sasbackup

# Create user accounts

# create the sas external account
adduser sas
# create the sassrv external account
adduser sassrv

#create the sas demo user
adduser sasdemo

# create the sas installers group
groupadd sasinstall

#create the generic sasusers group
groupadd sasusers

# make sas and sassrv a member of the group sasinstall
usermod -a -G sasinstall sas
usermod -a -G sasinstall sassrv

#make sassrv and sasdemo a member of the group sasusers
usermod -a -G sasusers sasdemo
# Make group sasinstall the primary group of sas
usermod -g sasinstall sas

#add sas to root group
usermod -aG wheel sas

# Mount Drive
mount /dev/xvdf1 /mnt/sasdepot

#copy the files from /mnt/sasdepot to /opt/sas/sasdepot
cp -avr /mnt/sasdepot /opt/sas/

chown -R sas:sasinstall /opt/sas/

chmod -R 775 /opt/sas/