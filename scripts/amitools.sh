#!/bin/bash
#***********************************************  #KickOS install script  ***********************************
# Install KickOS
# B.Titze 2021
#***********************************************  Amitools instll ***********************************





if [ ! -d /home/pi/Amiga/dir/WB ]; then
      sudo python3 -m pip install -U pip
      sudo python3 -m pip install -U setuptools
      sudo pip install amitools  
      
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
      
      mkdir /home/pi/Amiga/Install
      




      

if [ ! -f /home/$USER/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      
      cd /home/pi/Amiga/Install
      
      
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      mv  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      
        else 
      echo " "
      
      fi
      
      sudo rm -rf  /home/pi/Amiga/dir/System_P96/
      sudo rm -rf  /home/pi/Amiga/dir/System_ADVSP/
      
      
      echo " "
      echo " "
      echo "  Configure System_ADVSP ...   " 
      
      mkdir /home/pi/Amiga/dir/System_ADVSP
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_ADVSP.hdf unpack /home/pi/Amiga/dir/System_ADVSP
      
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_ADVSP/System/T/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Software /home/pi/Amiga/dir/System_ADVSP/System/
      cp -rf /home/pi/Amiga/dir/Games/Kickstarts /home/pi/Amiga/dir/System_ADVSP/System/Devs/
      
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      
      mkdir /home/pi/Amiga/dir/System_P96
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_P96/System/T/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/User-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      
      cp -rf /home/pi/Amiga/dir/System_ADVSP/System/Temp/* /home/pi/Amiga/dir/System_P96/System/Temp/
      cp -rf /home/pi/.KickPi-OS/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Software /home/pi/Amiga/dir/System_P96/System/    
      cp -rf /home/pi/Amiga/dir/Games/Kickstarts /home/pi/Amiga/dir/System_P96/System/Devs/
      #rm -rf /home/pi/Amiga/Install/ClassicWB_UAE_v28/
      
 

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
      #unzip -u ./ClassicWB_68K_v28.zip
      

      
    else 
      echo " "
    fi 

      
 echo "Ready to fire up Amiga..."     

      

       sudo chmod -R 777 /home/$USER/Amiga
      

      
      
      
