#!/bin/sh -x

sleep 30
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y python-pip
sudo pip install virtualenv
virtualenv --python=python3.4 virtualized
. virtualized/bin/activate
pip install  gunicorn
pip install  django
mkdir project
cd project
git init
# Make sure the clone is done with https
git remote add origin https://github.com/SorenOlegnowicz/urly-bird-lite.git
git pull origin master
