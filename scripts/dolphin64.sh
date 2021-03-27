#!/bin/bash
# https://www.raspberrypi.org/forums/viewtopic.php?t=276391
sudo apt install -y  cmake pkg-config gcc libwxbase3.0-dev libwxgtk3.0-dev libgtk2.0-dev libxext-dev libreadline-dev libgl1-mesa-dev libevdev-dev libudev-dev libasound-dev libpulse-dev libao-dev libopenal-dev libavcodec-dev libavformat-dev libswscale-dev libenet-dev liblzo2-dev libminiupnpc-dev libpolarssl-dev libsoil-dev libsoundtouch-dev libsfml-dev libusb-1.0-0-dev libbluetooth-dev libxrandr-dev qtbase5-private-dev

cd 
git clone https://github.com/dolphin-emu/dolphin.git dolphin-emu 

cd dolphin-emu


mkdir build && cd build

sudo cmake ..

sudo make

sudo make install
#**************************************************************
#nano ~./config/dolphin-emu/GFX.ini 

#Find this -> [Settings]

#Under it type this
#PreferGLES = True

#hit CTRL + X
#hit Enter
