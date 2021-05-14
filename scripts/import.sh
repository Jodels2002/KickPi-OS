#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #Pimiga                    ***********************************
sudo mount -a  

if [ ! -d /media/pi/rootfs/home/pi/pimiga/ ]; then

clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
      echo "            Pimiga found:)              "
      echo "coppy file.... this takes a while... "
    
cp -rf /media/pi/rootfs/home/pi/pimiga/  /home/$USER/


else

      echo " "
      echo " "
fi
