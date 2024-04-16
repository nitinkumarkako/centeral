#!/bin/bash
# First of all we are install the package of NFS client 
yum install nfs-utils rpcbind 

# start and enable the NFS client services
systemctl start nfs-utils rpcbind
systemctl enable  nfs-utils rpcbind

# mount the directory 
echo -e "Enter the IP of NFS_SERVER: \c"
read IP 
echo -e "Enter the location of NFS server File/Directory: \c"
read LOCATION
echo -e "Enter the server file and Directory Name: \c"
read FILE 

mkdir /mnt/NFS_SERVER

showmount -e $IP
mount $IP:$LOCATION /mnt/NFS_SERVER

