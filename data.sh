#!/bin/bash
sudo yum update -y
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install git -y 
git clone https://github.com/Akiranred/candy-crush.git /var/www/html

