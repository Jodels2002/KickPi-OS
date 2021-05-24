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
      mkdir /home/pi/tmp/DH0/
      mkdir /home/pi/Amiga/Install
      




      

if [ ! -f /home/$USER/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      
      cd /home/pi/Amiga/Install
      
      
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      mv  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      
      
      
      echo " "
      echo " "
      echo "  Configure System_ADVSP ...   " 
      
      mkdir /home/pi/Amiga/dir/System_ADVSP
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_ADVSP.hdf unpack /home/pi/Amiga/dir/System_ADVSP
      
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_ADVSP/System/T/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      
      
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      
      mkdir /home/pi/Amiga/dir/System_P96
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_P96/System/T/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      
      cp -rf /home/pi/Amiga/dir/System_ADVSP/System/Temp/* /home/pi/Amiga/dir/System_P96/System/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
          
      
      #rm -rf /home/pi/Amiga/Install/ClassicWB_UAE_v28/
      
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
      cd /home/pi/Amiga/Install
      #get http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip -u ./ClassicWB_68K_v28.zip
      
      mkdir /home/pi/Amiga/hdf/ClassicWB_68K_v28/
      mkdir /home/pi/tmp/Workbench/
      cp -rf /home/pi/Amiga/dir/Workbench31/* /home/pi/tmp/Workbench/
      cp -rf /home/pi/Amiga/Install/ClassicWB_68K_v28/System.hdf /home/pi/Amiga/hdf/ClassicWB_68K_v28/
      cd /home/pi/Amiga/hdf/ClassicWB_68K_v28/
      xdftool System.hdf unpack /home/pi/tmp/
      cp -rf /home/pi/tmp/System/* /home/pi/tmp/DH0/
      cp -rf /home/pi/tmp/System/T/Science /home/pi/tmp/DH0/S/Startup-Sequence
      
      
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
      
      
      
