#!/bin/bash
# Initialise uses and root sas folder for SAS 9.4 Install
# ****************************************************************************************
#
# Intro:
#
# This file creates the user accounts groups
#
# ****************************************************************************************

# Create user accounts
# create the sas external account
adduser -m sas

# create the sassrv external account
adduser -m sassrv

#create the sas demo user
adduser -m sasdemo

defaultpwd=Butterfly2020
 
#add additional users
adduser -m henrynb
adduser -m waynec; echo defaultpwd | passwd waynec --stdin
adduser -m sarab; echo defaultpwd | passwd sarab --stdin
adduser -m robb; echo defaultpwd | passwd robb --stdin
adduser -m robs; echo defaultpwd | passwd robs --stdin
adduser -m martins; echo defaultpwd | passwd martins --stdin
adduser -m jamesh; echo defaultpwd | passwd jamesh --stdin
adduser -m lucyw; echo defaultpwd | passwd lucyw --stdin
adduser -m pradnyap; echo defaultpwd | passwd pradnyap --stdin
adduser -m patricka; echo defaultpwd | passwd patricka --stdin
adduser -m subbermans; echo defaultpwd | passwd subbermans --stdin

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


