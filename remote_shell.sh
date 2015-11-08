#!/bin/sh -x

sleep 30
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y python-pip
sudo pip install virtualenv
virtualenv --python=python3.4 virtualized
