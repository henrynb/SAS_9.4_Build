# install java
# need new path
# yum install /opt/sas/sasdepot/third_party/jre-8u251-linux-x64.rpm -y

#create directory
mkdir -p ~/sasfiles/
mkdir -p ~/saswork/

chown -R sas:sasinstall /opt/sas/
chown -R sas:sasinstall /etc/opt/vmware/vfabric/

chmod -R 775 /opt/sas/
