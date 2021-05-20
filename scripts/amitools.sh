#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#***********************************************  Amitools instll ***********************************
sudo python3 -m pip install -U pip
sudo python3 -m pip install -U setuptools

sudo pip install amitools

if [ ! -d /home/pi/Amiga/dir/WB ]; then
      cd /home/pi/Amiga/adf/
      mkdir /home/pi/Amiga/dir/WB
      #xdftool amiga-os-300-workbench.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-workbench.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-extras.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-fonts.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-locale.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-storage.adf unpack /home/pi/Amiga/dir/WB
      xdftool amiga-os-310-install.adf unpack /home/pi/Amiga/dir/WB
     fi 
      
      #cp -rf /home/pi/tmp/Workbench3.0/ /home/pi/tmp/DH0/
      #cp -rf /home/pi/tmp/System/* /home/pi/tmp/DH0/
      #cp -rf /home/pi/tmp/System/T/Science /home/pi/tmp/DH0/S/Startup-Sequence

cd /home/$USER/Amiga/hdf/
git clone --depth=1 https://github.com/henrikstengaard/amiga-workbench-setup.git


if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      cp -rf "/home/pi/Amiga/hdf/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      cd "/home/pi/Amiga/hdf/ClassicWB_UAE_v28/Hard Disk/"
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      mkdir /home/pi/Amiga/dir/System_P96
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
     
      cp -rf /home/pi/.KickOS/Amiga/Install.zip /home/pi/tmp/
      cd /home/pi/tmp/
      unzip -u ./Install.zip
      cp -rf /home/pi/tmp/Workbench3.1/* /home/pi/Amiga/dir/System_P96/System/
      
      
      echo " "
      echo " "
      echo "  Configure System_ADVSP ...   " 
      mkdir /home/pi/Amiga/dir/System_ADVSP
      xdftool System_ADVSP.hdf unpack /home/pi/Amiga/dir/System_ADVSP
      
      
      else 
      echo " "
      
      fi
       if [ ! -f "/home/$USER/Amiga/hdf/ClassicWB_68K_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip -u ./ClassicWB_68K_v28.zip
    else 
      echo " "
    fi 
      
      
      
    if [ ! -f "/home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      toilet "full 64bit" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      cd "/home/$USER/Amiga/hdf/"
      #wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
    else 
      clear
      
    fi
      
    if [ ! -f "/home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip" ]; then
      clear
      toilet "KickOS" --metal
      toilet "full 64bit" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_OS39_v28 ...   KickOS full  " 
      echo " "
      echo " "
      cd "/home/$USER/Amiga/hdf/"
      
      #wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip -u ./ClassicWB_OS39_v28.zip
    else 
      clear
      
    fi
      
      
      #cd /home/pi/Amiga/adf/
      #xdftool amiga-os-300-workbench.adf unpack /home/pi/tmp/
      #cp -rf /home/pi/tmp/Workbench3.0/ /home/pi/tmp/DH0/
      #cp -rf /home/pi/tmp/System/* /home/pi/tmp/DH0/
      #cp -rf /home/pi/tmp/System/T/Science /home/pi/tmp/DH0/S/Startup-Sequence
      
      
      
