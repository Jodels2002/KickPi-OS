
sudo apt-get -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""
      toilet "KickPi-OS" --metal
      toilet "64 bit" --metal
      
      sudo apt-get -y install gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
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
      sudo apt-get -y install gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev

      cd
      git clone -b dev https://github.com/midwan/amiberry
      cd amiberry
      make -j2 PLATFORM=rpi4
fi    
