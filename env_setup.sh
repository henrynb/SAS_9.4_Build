#!/bin/bash
# Initialise system for SAS 9.4 Install
# ****************************************************************************************
#
# Intro:
#
# This file creates the user accounts groups
#
# ****************************************************************************************


# ****************************************************************************************
#
# Create users
#
# ****************************************************************************************

# Create directories

# Create the directory to mount the sas depot volume
mkdir /mnt/sasdepot

# create the root folder for SAS
mkdir /opt/sas

# Create the mount for sasdepot (Assumes the volume lable)
mount /dev/xvdf1 /opt/sas

# Create the mount for sas (Assumes the volume lable)
#mount /dev/xvdg1 /opt/sas

# following is not needed as /opt/sas should contain current build of binaries
# create folder for hotfix management
#mkdir /opt/sas/SASHFADD

#create folder for junit
#mkdir /opt/sas/junit

#create the directory for sasdepot. /opt/sas/sasdepot is the local sasdepot copy
#mkdir /opt/sas/sasdepot

# create the sashome directory. sashome is the default for the sas binaries
#mkdir /opt/sas/sashome

# create the sasconfig directory. sasconfig contains sas configuration
#mkdir /opt/sas/sasconfig

# create the sasbackup directory. sas backup is used by the deployment backup and restore process
#mkdir /opt/sas/sasbackup

# Create user accounts

# create the sas external account
adduser -m sas

# create the sassrv external account
adduser -m sassrv

#create the sas demo user
adduser -m sasdemo

# create the sas installers group
groupadd sasinstall

#create the generic sasusers group
groupadd sasusers

# make sas and sassrv a member of the group sasinstall
usermod -aG sasinstall sas
usermod -aG sasinstall sassrv

#make sassrv and sasdemo a member of the group sasusers
usermod -aG sasusers sasdemo

# Make group sasinstall the primary group of sas
usermod -g sasinstall sas

#add sas to root group
usermod -aG wheel sas

# Mount Drive
# mount /dev/xvdf1 /mnt/sasdepot

#copy the files from /mnt/sasdepot to /opt/sas/sasdepot
# copy not needed
#cp -avr /mnt/sasdepot /opt/sas/

#chown -R sas:sasinstall /opt/sas/

#chmod -R 775 /opt/sas/
