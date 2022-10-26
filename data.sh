#!/bin/bash
sudo yum update -y
sudo yum -y install git
sudo yum -y istall httpd
sudo systemctl start httpd
sudo systemctl enable httpd
git clone  /var/www/html/
