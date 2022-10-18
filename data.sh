#!/bin/bash
sudo yum update -y
sudo yum -y install git
sudo yum install python3-pip -y
sudo mkdir python
cd python
sudo git clone https://github.com/anilkumar3577/python-1-car-prediction.git
ls
cd python-1-car-prediction
pip3 install -r requirements.txt
python3 app.py
screen -m -d python3 app.py 


