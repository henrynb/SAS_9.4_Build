#!/bin/bash
# Initialise uses and root sas folder for SAS 9.4 Install
# ****************************************************************************************
#
# Intro:
#
# This file creates the user accounts groups
#
# ****************************************************************************************

# create the root folder for SAS
mkdir /opt/sas

# Create user accounts
# create the sas external account
adduser -m sas

# create the sassrv external account
adduser -m sassrv

#create the sas demo user
adduser -m sasdemo

#add additional users
adduser -m henrynb
adduser -m waynec
adduser -m sarab
adduser -m robb
adduser -m robs
adduser -m martins
adduser -m jamesh
adduser -m lucyw
adduser -m pradnyap
adduser -m patricka
adduser -m subbermans

# create the sas installers group
groupadd sasinstall

#create the generic sasusers group
groupadd sasusers

# make sas and sassrv a member of the group sasinstall
usermod -aG sasinstall sas
usermod -aG sasinstall sassrv

#make sassrv and sasdemo a member of the group sasusers
usermod -aG sasusers sasdemo

usermod -aG sasusers henrynb
usermod -aG sasusers waynec
usermod -aG sasusers sarab
usermod -aG sasusers robb
usermod -aG sasusers robs
usermod -aG sasusers martins
usermod -aG sasusers jamesh
usermod -aG sasusers lucyw
usermod -aG sasusers pradnyap
usermod -aG sasusers patricka
usermod -aG sasusers subbermans

# Make group sasinstall the primary group of sas
usermod -g sasinstall sas

#add sas to root group
usermod -aG wheel sas


