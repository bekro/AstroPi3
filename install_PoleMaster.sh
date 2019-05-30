#!/bin/bash

function display
{
    echo ""
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "~ $*"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ""
}

display "This script will install the PoleMaster software. Please make shure the OpenCV library is installed."

read -p "Are you ready to proceed (y/n)? " proceed

if [ "$proceed" != "y" ]
then
	exit
fi

display "Download and unzip the software"

cd ~
wget https://www.qhyccd.com/uploadfile/2018/1222/20181222054634222.zip
unzip 20181222054634222.zip -d 

if [ -e PoleMaster_Qt-for-RPI-Ubuntu-1.3.5.0.deb ]
then
    echo "Great success!"
else
    echo "Package not found. Bailing out."
    exit
fi

display "Installing the PoleMaster_Qt-for-RPI-Ubuntu-1 package"

sudo dpkg -i PoleMaster_Qt-for-RPI-Ubuntu-1.3.5.0.deb

display "Checking all the dependencies"
cd /usr/bin/PoleMaster
ldd PoleMaster