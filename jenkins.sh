#!/bin/bash

# first of all we are update the our server 
sudo apt update -y


# we are install the java on the server because  jenkins is wright in java code 
sudo  apt install default-jre  -y


#  add the repository key to the system:
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -


# Next, let’s append the Debian package repository address to the server’s sources.list:
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


# we will run the apt update because use the new repository
sudo apt update -y

# Finaly we are install the jenkins 
sudo apt install jenkins -y


# start and enable the jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins


