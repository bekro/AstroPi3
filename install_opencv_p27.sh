#!/bin/bash

function display
{
    echo ""
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "~ $*"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo ""
}

display "Cloning OpenCV repository"

cvVersion="2.4.13.7"
cd ~
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout $cvVersion

display "Install Numpy"
pip install numpy

display "Purge build folder"
cd ~/opencv && rm -rf build && mkdir build && cd build

display "Make build files"
cmake -D CMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local \
 -D INSTALL_PYTHON_EXAMPLES=ON \
 -D INSTALL_C_EXAMPLES=ON \
 -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
 -D BUILD_EXAMPLES=ON ..

display "Compile OpenCV"
make -j2

display "Install OpenCV"
sudo make install && sudo ldconfig