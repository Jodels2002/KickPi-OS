#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021

sudo chmod -R 777 /usr/local/bin/
pimigainst.sh
clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "            Pimiga importer             "
      echo " "
      echo "       Copy Pimiga files ..."
      echo " ... takes a while"
      echo " "

sudo cp -R /media/pi/rootfs/home/pi/pimiga/ /home/pi
 
  Pimiga.sh   
      echo " "
      echo "       configure files ..."
      
      sudo chmod -R 777 pimiga 
      
