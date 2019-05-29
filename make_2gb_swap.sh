#!/bin/bash

function display
{
    echo ""
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "~ $*"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ""
}

display "Creating 2GB SWAP Memory"
sudo swapoff -a
sudo fallocate -l 2G /swapfile 
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show

display "Install Python 2.7"
sudo apt-get -y install python2.7-dev

display "Get and install Pip"
cd ~ && wget https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py