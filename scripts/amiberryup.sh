
sudo apt-get -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
sudo rm -rf /home/$USER/amiberry/

if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""
      toilet "KickPi-OS" --metal
      toilet "64 bit" --metal
      
     
      cd
      git clone -b dev https://github.com/midwan/amiberry
      cd amiberry
      #make -j2 PLATFORM=pi64
      make -j2 PLATFORM=pi64-dispmanx
    else 
      clear
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
      toilet "KickPi-OS" --metal
      REVCODE=$(sudo cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^ *//g' | sed 's/ *$//g')
      
if [ "$REVCODE" = "a02082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 1 GB RAM"
	echo "$PIMODEL ($REVCODE)"
      cd
      git clone -b dev https://github.com/midwan/amiberry
      cd amiberry
     make -j2 PLATFORM=rpi3

fi
if [ "$REVCODE" = "a020d3" ]; then
    PIMODEL="Raspberry Pi 3 Model B Plus, 1 GB RAM"
	echo "$PIMODEL ($REVCODE)"
      cd
      git clone -b dev https://github.com/midwan/amiberry
      cd amiberry
      make -j2 PLATFORM=rpi3


fi
if [ "$REVCODE" = "a22082" ]; then
    PIMODEL="Raspberry Pi 3 Model B, 2 GB RAM"
	echo "$PIMODEL ($REVCODE)"
      cd
      git clone -b dev https://github.com/midwan/amiberry
      cd amiberry
      make -j2 PLATFORM=rpi3
fi
      cd
      git clone -b dev https://github.com/midwan/amiberry
      cd amiberry
      make -j2 PLATFORM=rpi4
fi  
sudo chmod -R 777 /home/$USER/amiberry
cp -rf /home/$USER/amiberry/amiberry  /home/$USER/Amiga/ 

