#!/bin/bash
# Install KickPi-OS
# B.Titze 2021


Update_Amiberry.sh
  
  

 cd
 sudo rm -rf amiberry
 
 git clone -b dev https://github.com/midwan/amiberry
      # git clone https://github.com/midwan/amiberry
      cd amiberry

if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      toilet "KickPi-OS" --metal
      echo ""
      echo "Raspberry Pi 4 OS 64 bit SDL-Dispmanx"
      echo ""
    
      #make -j4 PLATFORM=rpi4-64-sdl2
      make -j4 PLATFORM=rpi4-64-dmx
    else 
      clear
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
      toilet "KickPi-OS" --metal
      REVCODE=$(sudo cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^ *//g' | sed 's/ *$//g')
      
	if [ "$REVCODE" = "a02082" ]; then
    	PIMODEL="Raspberry Pi 3 Model B, 1 GB RAM"
		echo "$PIMODEL ($REVCODE)"
		echo ""
      		
     		make -j2 PLATFORM=rpi3

	fi
	if [ "$REVCODE" = "a020d3" ]; then
	    PIMODEL="Raspberry Pi 3 Model B Plus, 1 GB RAM"
		echo ""
		echo "$PIMODEL ($REVCODE)"
	     
	      make -j2 PLATFORM=rpi3


	fi
	if [ "$REVCODE" = "a22082" ]; then
	    PIMODEL="Raspberry Pi 3 Model B, 2 GB RAM"
		echo "$PIMODEL ($REVCODE)"
		echo ""
	     
	      make -j2 PLATFORM=rpi3
	fi
	      echo ""
	      echo "Raspberry Pi 4 SDL 32bit"
	     
	      make -j2 PLATFORM=rpi4
fi  

if [ "$REVCODE" = "9000C1" ]; then
    PIMODEL="Raspberry Pi Zero W"
	echo "$PIMODEL ($REVCODE)"
	sudo raspi-config nonint is_pi
        make PLATFORM=rpi1

fi

sudo chmod -R 777 /home/$USER/amiberry
cp -rf /home/$USER/amiberry/amiberry  /home/$USER/amiberry/amiberry_old
cp -rf /home/$USER/amiberry/amiberry  /home/$USER/Amiga/ 

