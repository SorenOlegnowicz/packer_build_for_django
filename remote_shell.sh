#!/bin/sh -x

# The total number of changes to be made for this file is: 1
# (1) The Clone URL for your github repository
# Note: Please replace the brackets with the appropriate information.

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
# (1) Make sure the clone is done with https
git remote add origin [clone_url]
git pull origin master
