# repair Audio

sudo apt-get -y purge libraspberrypi-dev 
          	
	sudo apt-get -y remove pulseaudio
	sudo apt-get -y install pulseaudio
	sudo /etc/init.d/alsa-utils reset
	sudo apt-get -y install pi-bluetooth
	sudo apt-get -y install bluez bluez-firmware baobab 
	sudo usermod -G bluetooth -a pi

#make Amiberry
cd

 
 git clone -b dev https://github.com/midwan/amiberry
      # git clone https://github.com/midwan/amiberry
      cd amiberry
      
      make -j4 PLATFORM=rpi3
      
     
      cp -rf /home/pi/amiberry/amiberry  /home/$USER/Amiga/ 
      cp -rf /home/pi/amiberry/amiberry  /home/$USER/Amiga/amiberry_dev
      
   
      make -j4 PLATFORM=rpi3-sdl2
      
      cp -rf /home/pi/amiberry/amiberry  /home/$USER/Amiga/amiberry_sdl
      cp -rf  /home/pi/Amiga/amiberr* /opt/Backup
