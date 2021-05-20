#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021
#******************************************** #startup-sequence  :-) ************* ********************************************

clear
echo "Welcome to KickPi-OS"
echo " "
echo " "

      sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
      sudo apt -y update
      sudo apt-get install -y toilet dialog mc zip unzip
      whiptail --msgbox "Optional: \n  \n  Now insert your * AMIGA * USB stick with the \n  * Shared * folder into the Raspberry" 15 50 1



if    [ ! -d "/media/pi/AMIGA/Shared/" ]; then
	  clear
	else
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files will take 2-5 min "
          mkdir /home/$USER/Amiga 
	  cp -rf /media/pi/AMIGA/Shared/* ~/Amiga  
	  
          fi

if    [ ! -d "/media/usb0/Shared/" ]; then
          clear
	else
	  clear
          echo "***  Amiga Forever files found ***"
	  echo " "
	  echo "... copy files to Amibian will take 2-5 min "
	  cp -rf /media/usb0/Shared/* ~/Amiga  
	  
          fi
	 
	 REVCODE=$(sudo cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^ *//g' | sed 's/ *$//g')

if [ "$REVCODE" = "a02082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 1 GB RAM"
	echo "$PIMODEL ($REVCODE)"
	sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
        sudo raspi-config nonint is_pi
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo cp -R /home/$USER/KickPi-OS/config/config3b.txt /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
#sudo raspi-config nonint get_i2c
sudo chmod -R 777 /home/$USER/Amiga   
sudo reboot

fi
if [ "$REVCODE" = "a020d3" ]; then
    PIMODEL="Raspberry Pi 3 Model B Plus, 1 GB RAM"
	echo "$PIMODEL ($REVCODE)"
	sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
        sudo raspi-config nonint is_pi
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo cp -R /home/$USER/KickPi-OS/config/config3b.txt /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
#sudo raspi-config nonint get_i2c
sudo chmod -R 777 /home/$USER/Amiga   
sudo reboot

fi
if [ "$REVCODE" = "a22082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 2 GB RAM"
	echo "$PIMODEL ($REVCODE)"
	sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
        sudo raspi-config nonint is_pi
cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc
sudo cp -R /home/$USER/KickPi-OS/config/config3b.txt /boot/config.txt
sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
#sudo raspi-config nonint get_i2c
sudo chmod -R 777 /home/$USER/Amiga   
sudo reboot

fi
	 
if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""
      
      sudo cp -R /home/$USER/KickPi-OS/config/config64.txt /boot/config.txt
      sleep 3s
    else 
      clear
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
      
      sudo cp -R /home/$USER/KickPi-OS/config/config.txt /boot/config.txt
      sleep 3s
fi  

if ! grep -q '# Amiga RAM Drive' /etc/fstab ; then
   sudo rm -rf /home/pi/tmp
   sudo mkdir /home/pi/tmp
   sudo chmod -R 777 /home/pi/tmp
   sudo chmod -R 777 /etc/fstab
   sudo  echo '# Amiga RAM Drive' >> /etc/fstab
   echo 'tmpfs /home/pi/tmp tmpfs nodev,nosuid,size=1024M 0 0 ' >> /etc/fstab
   else
   clear
   echo "Amiga RAM Disk always installed..." 
fi  

sudo mount -a   

sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin

cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc

sudo raspi-config nonint do_boot_behaviour B2
sudo raspi-config nonint get_ssh
#sudo raspi-config nonint get_i2c
sudo chmod -R 777 /home/$USER/Amiga   
sudo reboot
