
sudo apt-get install libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 libraspberrypi-dev
sudo apt-get install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev 
sudo apt-get -y install make g++



sudo rm -rf amiberry

 cd
      git clone -b dev https://github.com/midwan/amiberry
      # git clone https://github.com/midwan/amiberry
      cd amiberry

if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      toilet "KickPi-OS" --metal
      echo ""
      echo "Raspberry Pi 4 OS 64 bit SDL-Dispmanx"
      echo ""
    
      make -j4 PLATFORM=PLATFORM=rpi4-64-sdl2
      #make -j4 PLATFORM=rpi4-64-dmx
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
cp -rf /home/$USER/amiberry/amiberry  /home/$USER/Amiga/ 

