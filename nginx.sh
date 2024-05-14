#!/bin/bash
# we are install the nginx web server on our machine
sudo yum install nginx  -y

# start and enable nginx web server because by default nginx web server is disabled
sudo systemctl start nginx
sudo systemctl enable nginx
#sudo yum install httpd -y
# install git for download git hub package in our server 
sudo yum install git -y

#configure virtual hosting and redirect website 
sudo echo "
server {
 	listen 80;
#	server web1;
	root /usr/share/nginx/web1;
	index index.html;
	location /web {
	alias /usr/share/nginx/web2;
}
    } " > /etc/nginx/conf.d/nitin.conf

# remove all files and folders 
sudo rm -rvf /usr/share/nginx/html
sudo mkdir /usr/share/nginx/web1
sudo git clone https://github.com/Muskan7042/IndiaTour.git /usr/share/nginx/web1/
sudo mkdir /usr/share/nginx/web2
sudo git clone https://github.com/codewithsadee/tourest.git /usr/share/nginx/web2/
sudo systemctl restart nginx

	
