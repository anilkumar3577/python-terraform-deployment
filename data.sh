#!/bin/bash
sudo yum update -y
sudo yum -y install git
git clone https://github.com/anilkumar3577/python7-USA-housing.git
cd python7-USA-housing
pip3 install -r requirements.txt
screen -m -d python3 app.py
