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
adduser -m sas; echo BzPxt3RX | passwd sas --stdin

# create the sassrv external account
adduser -m sassrv; echo 5nzTRqDY | passwd sassrv --stdin

#create the sas demo user
adduser -m sasdemo; echo X7Q8ARz4 | passwd sasdemo --stdin
 
#add additional users
adduser -m henrynb
adduser -m waynec; echo Butterfly2020 | passwd waynec --stdin
adduser -m sarab; echo Butterfly2020 | passwd sarab --stdin
adduser -m robb; echo Butterfly2020 | passwd robb --stdin
adduser -m robs; echo Butterfly2020 | passwd robs --stdin
adduser -m martins; echo Butterfly2020 | passwd martins --stdin
adduser -m jamesh; echo Butterfly2020 | passwd jamesh --stdin
adduser -m lucyw; echo Butterfly2020 | passwd lucyw --stdin
adduser -m pradnyap; echo Butterfly2020 | passwd pradnyap --stdin
adduser -m patricka; echo Butterfly2020 | passwd patricka --stdin
adduser -m subbermans; echo Butterfly2020 | passwd subbermans --stdin

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


chown -R sas:sasinstall /mnt/sasdepot
chown -R sas:sasinstall /opt/sas

chmod -R 775 /opt/sas
#chown -R sas:sasinstall /etc/opt/vmware/vfabric/

chmod -R 775 /mnt/sasdepot

