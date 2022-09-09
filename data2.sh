#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install git -y
sudo git clone https://github.com/Akiranred/mario.git /var/www/html
