#!/bin/bash

echo "Welcome to This script:"
# use read condition for ask port of virtualhost 
read -p "Enter port Number:" PORT
# again use read condition for ask host directory
 read -p "Enter Host Directory Name:" HOST
# again use read condition for ask configuration File Name

read -p "Enter Configuration File Name(*.conf):" FILE
# read condition use for server name 
#read -p "Enter Server Name:" NAME

# start script for nginx Virtualhosting 

echo "
       server  {
                 listen $PORT;
		 server_name $HOST.com;
		 root /usr/share/nginx/html/$HOST;
		 error_log /var/log/nginx/$HOST-error.log;
		 access_log /var/log/nginx/$HOST-access.log;
	 } " > /etc/nginx/conf.d/$FILE

# Inster data in index.html
mkdir /usr/share/nginx/html/$HOST
echo "This site runing on $PORT" > /usr/share/nginx/html/$HOST/index.html

 # Add port in firewall 

firewall-cmd --permanent --add-port=$PORT/tcp
firewall-cmd --reload 
semanage port -a -t http_port_t -p tcp $PORT
  semanage port -l | grep http
 
# Reload nginx service 

systemctl reload nginx
systemctl status nginx

