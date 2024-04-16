#!/bin/bash
# First of all we are install the package of NFS server
yum install nfs-utils libnfsidmap

# Enable and start the nfs server
systemctl start rpcbind.service nfs-server rpc-statd nfs-idmapd.service
systemctl enable rpcbind.service nfs-server rpc-statd nfs-idmapd.service

# configure the NFS server in the configuration file /etc/exports
echo -e "Enter the Location of share File and Directory: \c"
read LOCATION

echo -e "Ente the client IP: \c"
read IP

echo "
$LOCATION $IP(rw,sync,no_root_squash) " >> /etc/exports

# changes loaded
 exportfs -rv 
 firewall-cmd --permanent --add-service=nfs.service

