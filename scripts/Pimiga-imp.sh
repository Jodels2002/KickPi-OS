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


sudo mkdir /home/pi/pimiga/
sudo mkdir /home/pi/pimiga/disks/

sudo rsync --info=progress2 -auvz /media/pi/rootfs/home/pi/pimiga/disks/ /home/pi/pimiga/disks/
sudo chmod -R 777 /home/pi/pimiga
 
  Pimiga.sh   
      clear
      echo " copy finished "
      echo "      ..configure files ..."
      
      sudo chmod -R 777 pimiga 
      echo "      ready ..."
      
      
      # sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/Mame0.34/roms/ /home/pi/RetroPie/roms/arcade/
      # sudo rsync --info=progress2 -auvz /home/pi/pimiga/disks/System/Emulators/GnGeo/roms/ /home/pi/RetroPie/roms/neogeo/
      # sudo cp -R -f -v /home/pi/pimiga/disks/System/Emulators/PocketSNES/roms/ /home/pi/RetroPie/roms/mastersystem/
