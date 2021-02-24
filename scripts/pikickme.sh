#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************
## PWR-LED (green) 
#dtoverlay = pwr-led, gpio = 17
# HDD LED (orange)
#dtoverlay = act-led, gpio = 27
#************************************************  #History   ************************************************
#16.02 add TwisertOS, Bugfix Update optimiced, RetroPie Bugfix (Autoconfig Amiberry)  Bugfix 64 bit, Worker preconfigured / OK
#16.02 Bugfix Reboot, Speedup
#20.02 Photogimp, Autoboot to Amiberry
#20.02 Bootmenu, Speedup Boot time
#Amiberry64=amiberry-v3.3-rpi4-64bit.zip

#***********************************************  #Are you runing Desktop?  ***********************************

#************************************************  #Amiberry Version   ************************************************
#Amiberry32=amiberry-v3.3-rpi4-dmx-32bit.zip
#Amiberry64=amiberry-v3.3-rpi4-64bit.zip
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
cp -rf  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
#***********************************************  #Are you runing Desktop?  ***********************************
#if  xset q &>/dev/null; then
   # echo "Please dont´t run this script under Linux Desktop" >&2
   # sleep 15s
   # exit 1
#fi 

#***********************************************  #Preinstall stuff *****************************************
#*************************************************************************************************************
#sudo apt-mark hold lxpanel
 


clear
if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""
      toilet "KickPi-OS" --metal
      toilet "64 bit" --metal
      echo ""
      
    else 
      clear
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
      toilet "KickPi-OS" --metal
      
fi    
      
      echo ""
      echo " "
      echo "1>	Hi Guys,"
      echo " "
      echo "1>	welcome to the "KickPi-OS" installer! "
      echo "1>CLI"
      echo "1>CLI"
      echo "1>	Please note that the Kickroms and Workbench files are still under copyright (Amiga Forever)!  "
      echo "1>CLI"
      echo "1>	So only use this image if you own the original Amigas, Amiga Forever."
      echo "1>CLI: "
      echo "1>                  Greetings your´s "
      echo "1>Assign >NIL:      Bernd Titze"
      echo " "
      echo " " 
      echo "	LOADWB ...  :-)"
      sleep 4s
      echo " "
      echo " "     
      
      
sudo rm -rf /home/$USER/.local/share/Trash/*
  
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
     
#******************************************** #KickPi-OS mini  Menu ********************************************
#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="KickPi-OS"
TITLE="Witch KickPi-OS you want?"
MENU="Please select:"

OPTIONS=(1 "Install KickPi-OS       (recommended)            (ca. 20 min)"
	 2 "Install KickPi-OS full + Office Suite +  more    (ca. 30 min)"
         3 "Install KickPi-OS light                          (ca. 10 min)")
        

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   
#*********************************************  #OLED & LED comming soon, maybe :)  *****************************
#****************************************************************************************************************

#Poser() {

#sudo apt install -y python-dev
#sudo apt install -y python-smbus i2c-tools
#sudo apt install -y python-pil
#sudo apt install -y python-pip
#sudo apt install -y python-setuptools 
#sudo apt install -y python-dev
#sudo apt install -y python-smbus i2c-tools
#sudo apt install -y python-pil
#sudo apt install -y python-pip
#sudo apt install -y python-setuptools 

#its ok but dissabled
#cd /home/$USER/.KickPi-OS/OLED
#sudo chmod -R 777 /home/$USER/.KickPi-OS/OLED


# Test OLED
#i2cdetect -y 1
#echo " Should Say: "3C""
#python Amiga.py

#cd /home/$USER/.KickPi-OS/LED
#python LED.py


#}

#*********************************************  #Time to update:)  **********************************************
#****************************************************************************************************************

KickPi-OS_Update() {

      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo " "
      echo "Installing KickPi-OS Update System ..."
      echo " "
      echo " "
      sudo apt-get -y upgrade
      
      # Update allways Routine
      if [ ! -d /$User/pi/.KickPi-OS/ ]; then
#
      clear
      # Update is running
      rm /home/$USER/Amiga/conf/retroarch.cfg
      
      else 
      echo " "
      # First installation
      
      
      fi

}

#*********************************************  #Installing KickPi-OS_Tools*********************************
#**********************************************************************************************************

KickPi-OS_Tools() {

      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
      echo "            Lets install some usefull Tools:)              "
      echo " "
      echo " "

          
      sudo apt install -y mc zip unzip 
      sudo apt install -y geany geany-plugins-common geany-common xmlstarlet
       
       
      clear
      toilet "KickPi-OS" --metal
      
      #Some little Amiga stuff....
      sudo apt-get -y install  amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms 
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -rf /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
  
      # Preconfigure Worker
      if [ ! -f /home/$USER/.worker/.worker.zip ]; then
      # First installation
      clear
      cd /home/$USER/KickPi-OS/.pac/
      unzip -u  /home/$USER/KickPi-OS/.pac/.worker.zip
      cp -rf /home/$USER/KickPi-OS/.pac/.worker /home/$USER/
      sudo chmod -R 777 /home/$USER/.worker/
      

      else 
      echo " Tools up to date :) "
      # Configured
      
      fi
          
      
}

#*********************************************  #Office  **********************************************
#****************************************************************************************************************

KickPi-OS_Office() {

      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
      echo "            Office Tools:)              "
      echo " "
      
      sudo apt install -y libreoffice   
      #sudo apt install -y default-jdk tooo long install time libreoffice-gnome libreoffice-gtk3 
}

#*********************************************  #Video & Graphic  **********************************************
#****************************************************************************************************************

KickPi-OS_Video() {

      clear
       toilet "KickPi-OS" --metal

      echo " "
      echo " "
      echo "            Video & Graphics:)              "
      echo " "
           
if [ ! -d /home/$USER/.config/GIMP/ ]; then
#
      clear
      # Update is running
      sudo apt install -y gimp 
       clear
       toilet "KickPi-OS" --metal
       toilet -F gay PhotoGimp
       
       curl -L "https://github.com/Diolinux/PhotoGIMP/releases/download/1.0/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip" -o /home/$USER/KickPi-OS/PhotoGIMP.zip && unzip /home/$USER/KickPi-OS/PhotoGIMP.zip -d /home/$USER/KickPi-OS/ 
       sudo cp -R /home/$USER/KickPi-OS/PhotoGIMP\ by\ Diolinux\ v2020\ for\ Flatpak/.var/app/org.gimp.GIMP/config/* ~/.config
       echo " PhotoGimp by Diolinux installed..."
      
      sleep 3s
      else 
      
      echo " Gimp is already installed..."
      
      sleep 3s
          
      fi     
       
       
       clear
       toilet "KickPi-OS" --metal
       
      
      #sudo apt install -y  kdenlive kdenlive-data inkscape
}

#*********************************************  #Internet  **********************************************
#****************************************************************************************************************

KickPi-OS_Internet() {

      clear
       toilet "KickPi-OS" --metal
       toilet -F gay Internet

      echo " "
      echo " "
      echo "            Internet:)              "
     
      clear
       toilet "KickPi-OS" --metal
       toilet -F gay Internet
      sudo apt install -y youtube-dl minitube transmission 
}
#*********************************************  #Games  **********************************************
#****************************************************************************************************************

KickPi-OS_Games() {

      clear
       toilet "KickPi-OS" --metal
       toilet -F gay Games

      echo " "
      echo " "
      echo "            Games :)              "
      echo " "
      # sudo apt install -y games-finest much to long
     

}

#*********************************************  #Installing KickPi-OS Desktop*********************************
#**********************************************************************************************************
 
 KickPi-OS_Desktop() {
 #if  xset q &>/dev/null; then
          
    	    clear
		toilet "KickPi-OS" --metal
		echo "KickPI-OS ROM Operating System and Libraris" 
		echo "Version V1.1 2020-2021 KickPi-OS "
		echo "No Rights Reserved.  "
		echo ""

	#else 
	  
	
      sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session
      sudo apt purge -y raspberrypi-ui-mods 
      sudo apt purge -y cups cups-client cups-common cups-server-common
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
  
  # Preconfigure Silent Boot
      if [ ! -f ~/.backup/rc.local ]; then
      # First installation
      clear
      mkdir $HOME/.backup/profile.d
      sudo mv  /etc/rc.local ~/.backup/
      sudo rm -rf ~/.config/chromium/
      sudo cp -rf /home/$USER/KickPi-OS/config/rc.local /etc/rc.local
      sudo chmod -R 777 /etc/rc.local
      sudo systemctl mask plymouth-start.service
      sudo systemctl mask syslog.service
      sudo systemctl mask cups.service
      sudo systemctl mask cups-browsed.service
      
      else 
      echo " System optimized :) "
      # Configured
  fi    
          
 
 if [ ! -d $HOME/Desktop ]; then
     # DietPi, Pimiga.... as Host Distri not ready 

      sudo apt install -y git chromium-browser usbmount gparted
    
     cd
      git clone --depth=1 https://github.com/RPi-Distro/raspi-config.git
      sudo chmod -R 777 raspi-config
      sudo cp -rf $HOME/raspi-config/* /usr/bin/
      rm raspi-config

        mkdir $HOME/Desktop
        mkdir $HOME/Downloads
        mkdir $HOME/Documents
        mkdir $HOME/Music
        mkdir $HOME/Pictures
        mkdir $HOME/Videos
    fi      
  
      
      
      sudo chmod -R 777 /home/$USER/KickPi-OS
      sudo chmod -R 777 /home/$USER/.config
      sudo chmod -R 777 ~/.local
      sudo cp -rf ~/KickPi-OS ~/.KickPi-OS
      sudo rm -rf /home/$USER/.cache
      cd /home/$USER/KickPi-OS/
      cp -rf ~/KickPi-OS/config/Desktop/* /home/$USER/Desktop/

      sudo unzip ~/KickPi-OS/.pac/.data.pac

      sudo chmod -R 777 /home/$USER/KickPi-OS
      sudo chmod -R 777 /home/$USER/.local
      sudo chmod -R 777 /home/$USER/.config
      sudo rm -rf /home/$USER/.cache
      # Fresh install Amiga Desktop
    
if [ ! -f /usr/share/icons/AMIGAOSLINUX.zip ]; then

      cd /usr/share/icons/
      
      sudo cp -rf /home/$USER/KickPi-OS/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip -u  /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -rf /usr/share/icons/default
      sudo cp -rf /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      
      else 
      echo " "
fi     

if [ ! -d /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/KickPi-OS
      git clone --depth=1 https://github.com/x64k/amitk
      clear
      toilet "KickPi-OS" --metal
      sudo cp -rf /home/$USER/KickPi-OS/amitk /usr/share/themes
      
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      clear
      toilet "KickPi-OS" --metal
      sudo cp -rf /home/$USER/KickPi-OS/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -rf /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -rf /home/$USER/KickPi-OS/config/rpd-wallpaper/* /usr/share/backgrounds/
      else 
      echo " "
      
fi
  
  
     
  
  if [ $USER == "pi" ]; then
     

      # Settings XFCE4 Rasperry OS
       clear
       toilet "KickPi-OS" --metal
   
       cp -rf ~/KickPi-OS/.data/.config/ /home/$USER/
       cp -rf ~/KickPi-OS/.data/.local/ /home/$USER/  
       #sudo raspi-config nonint do_boot_behaviour B4
       else
       # Settings XFCE4 Amibian
               clear
               toilet -F gay Amibian
               echo ""
               echo ""
               echo "Hello Amibian User,"
               echo ""
               echo "Don't worry, Amibian service (menu, start, ..) stays as it is."
               echo "There is nothing to improve here. :-)"
               echo ""
               echo "Only the look of the desktop is adjusted a little ..."
               echo ".. and in addition we add things like Retropie, PiKiss, ... :-)"
	       echo ""
               sleep 1s
               echo "Backup Settings.... "
     
               #sudo cp -R /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
               sudo cp -R /usr/share/rpd-wallpaper/* /usr/share/backgrounds/
               
               sudo chmod -R 777 ~/.backup/
               cp -rf ~/.config/ ~/.backup/.config
               cp -rf ~/.local/ ~/.backup/.local
               cp -rf /usr/local/bin ~/.backup/usr
	       cp -rf ~/KickPi-OS/.data/.config/ /home/$USER/
	       clear
               toilet "KickPi-OS" --metal
               cp -rf ~/KickPi-OS/.data/.local/ /home/$USER/
               sudo rm -rf /home/$USER/.config
               
               
                cd  /home/amibian/KickPi-OS/.pac/amibian/
                unzip -u /home/amibian/KickPi-OS/.pac/amibian/.config.zip
		clear
      		toilet "KickPi-OS" --metal
                unzip -u /home/amibian/KickPi-OS/.pac/amibian/.local.zip
		clear
                toilet "KickPi-OS" --metal
                cp -rf /home/amibian/KickPi-OS/.pac/amibian/.config/ /home/$USER/
                cp -rf /home/amibian/KickPi-OS/.pac/amibian/.local/ /home/$USER/  
                sudo rm -rf  /home/amibian/.config/autostart/
                cd ~
                mkdir /home/amibian/Amiga/conf/ 
                cp -rf /home/amibian/KickPi-OS/Amiga/amibian/conf/* /home/amibian/Amiga/conf/
                cp -rf /home/amibian/KickPi-OS/Amiga/amibian/conf/* /home/amibian/Amiga/Emulators/amiberry/conf/
                cp -rf /home/amibian/KickPi-OS/Amiga/amibian/conf/* /home/amibian/Amiga/Emulators/amiberry-dev/conf/
      fi 
#fi

}


#***************************************** # Install Amiberry  *********************************************
#****************************************************************************************************************
     
     
 KickPi-OS_Amiberry() {
  
      
 
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 
       clear
       toilet "KickPi-OS" --metal
       toilet -F gay 64bit
       echo " "
       echo " "
       echo " ... here comes Amiberry 64 bit   :-)"
       
       
       
       cd ~
       
       
       if [ ! -f /home/$USER/Amiga/amiberry ]; then
       #sudo apt-get -y upgrade
       #sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4
       sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
       clear
       toilet "Amiberry" --metal
       toilet -F gay 64bit
       Amiberry
       echo "Compiling Pi64-dispmanx version "
       echo " "
       echo " "
       git clone -b dev https://github.com/midwan/amiberry
       cd amiberry
       make -j2 PLATFORM=pi64-dispmanx
      cp -rf /home/$USER/amiberry/  /home/$USER/Amiga/      
      else 
      echo " "
      fi
       
    
       
          #cd /home/$USER/KickPi-OS/Amiga
      	  #unzip -u /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-dmx-64bit.zip 
	  #sleep 1s
          #cp -rf /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-dmx-64bit/* /home/$USER/Amiga/
          #sudo chmod -R 777 /home/$USER/Amiga/
 
    else
       clear
       toilet "Amiberry" --metal
       toilet -F gay 32bit
      
	  echo "  ... here comes Amiberry 32 bit :-) "
	  sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
          cd /home/$USER/KickPi-OS/Amiga
      	  unzip -u /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-dmx-32bit.zip 
	  sleep 1s
          cp -rf /home/$USER/KickPi-OS/Amiga/amiberry-rpi4-dmx-32bit/* /home/$USER/Amiga/
         
    fi

   
}


#***************************************** # Configure Amiga *********************************************
#****************************************************************************************************************
     
     
      Configure_Amiga() {
       
             
      cd ~/Amiga
      mkdir /home/$USER/Amiga/conf/ 
      
           
      if [ ! -f /home/$USER/Amiga.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      cd ~
      cp -rf /home/$USER/KickPi-OS/Amiga/Amiga.zip /home/$USER
      unzip -u ./Amiga.zip
      rm ./Amiga.zip
      
      
      else 
      echo " "
      fi
      
      cd /home/$USER/Amiga/hdf
      
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_P96_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_P96_v28 ...     " 
      echo " "
      echo " "
      
      wget http://download.abime.net/classicwb/ClassicWB_P96_v28.zip
      unzip -u ./ClassicWB_P96_v28.zip
      else 
      clear
      toilet "KickPi-OS" --metal
      fi
      
          
      if [ ! -f "/home/$USER/Amiga/hdf/ClassicWB_68K_v28.zip" ]; then
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip -u ./ClassicWB_68K_v28.zip
      else 
      echo " "
         
      #if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip ]; then
      #clear
      #toilet "KickPi-OS" --metal
      #toilet "full 64bit" --metal
      #echo " "
      #echo " "
      #echo "  Configure ClassicWB_OS39_v28 ...   KickPi-OS full  " 
      #echo " "
      #echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      #unzip -u ./ClassicWB_OS39_v28.zip
      #else 
      #echo " "
      
      #fi
      
 
#else 
    
      fi
      
      #if [ ! -f "/home/$USER/Amiga/hdf/workbench-311.hdf" ]; then
      #clear
      #toilet "KickPi-OS" --metal
      #echo " "
      #echo " "
      #echo "  Configure AmigaForever workbench-311 ...     " 
      #echo " "
      #echo " "
      
     # fi
  
  if [ ! -f "/home/$USER/Amiga/dir/AROS/AROS.boot" ]; then
      cd /home/$USER/KickPi-OS/Amiga
      unzip -u /home/$USER/KickPi-OS/Amiga/AROS.zip
      mkdir /home/$USER/Amiga/dir/AROS/
     cp -rf /home/$USER/KickPi-OS/Amiga/AROS/* /home/$USER/Amiga/dir/AROS/
  fi
      cd /home/$USER/Amiga/hdf
      
      cd ~/Amiga
      clear
      toilet "KickPi-OS" --metal
   
      echo " "
      echo " "
      
        

      
      
     cp -rf /home/$USER/KickPi-OS/Amiga/conf/* /home/$USER/Amiga/conf/ 
     

      if    [ ! -d "/home/amibian/Amiga/Emulators/amiberry/conf/" ]; then
	  clear
	else
	  cp -rf /home/$USER/KickPi-OS/Amiga/conf/* /home/amibian/Amiga/Emulators/amiberry/conf/
	  cp -rf /home/$USER/KickPi-OS/Amiga/conf/* /home/amibian/Amiga/Emulators/amiberry-dev/conf/
          cp -rf /home/$USER/KickPi-OS/Amiga/conf/* /home/$USER/Documents/FS-UAE/Configurations/
	  
          fi
	  
      
      sudo chmod -R 777 /home/$USER/Amiga
    }    
   

    
#****************************************   #KickPi-OS_Addons  ****************************************************
#****************************************************************************************************************

KickPi-OS_Addons() {

if [ "$(getconf LONG_BIT)" == "64" ]; then
 
     echo "Vice64 todo"
      else 
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "Commodore Vice 32bit" 
      echo " "
      echo " "
      cd
      
      if [ ! -f /home/$USER/games/vice-3.4-bin-rpi.tar.gz ]; then
      
      mkdir $HOME/games
      cd $HOME/games
      wget https://misapuntesde.com/rpi_share/vice-3.4-bin-rpi.tar.gz
      tar xzf  ./vice-3.4-bin-rpi.tar.gz
      #rm ./vice-3.4-bin-rpi.tar.gz
     fi
      #Install PiKISS    
      if [ ! -d "/home/$USER/PiKISS/" ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo "Here comes PiKiss and Cool Retro Term" 
      echo " "
      cd
      git clone --depth=1 https://github.com/jmcerrejon/PiKISS
      sudo chmod -R 777 /home/$USER/PiKISS
      cd PiKISS
   
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      cd /home/$USER/KickPi-OS/config/
      ./retro-term.sh
      else 
      
      echo " "
     fi
 
 fi

}

     
#**********************************************  #Install Retropie/Setup  ***************************************
#****************************************************************************************************************
  
  
KickPi-OS_Retropie() {

 #Install Retropie/Setup Preinstall
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 
     echo "RetroPie64 todo"
     cd
     git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
     sudo chmod -R 777 /home/$USER/RetroPie-Setup/
  else 
  
      sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
      sudo apt install -y omxplayer chromium-codecs-ffmpeg   
      	if [ ! -f "/home/$USER/RetroPie-Setup/retropie_packages.sh" ]; then     
      	echo " "
      	clear
      	toilet "KickPi-OS" --metal
      	echo " "
      	echo "  ... here comes Retropie :-)     "   
      	echo " "
      	echo " "
      	sudo rm /etc/emulationstation/
      	sudo rm/opt/retropie/
      
      	mkdir /home/$USER/RetroPie/
      	mkdir /home/$USER/RetroPie/BIOS/
      	mkdir /home/$USER/RetroPie/splashscreens/
      	mkdir /home/$USER/RetroPie/roms
      
      	cd
      	git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
      	sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      	cd /home/$USER/RetroPie-Setup/ 
      	sudo __nodialog=1 ./retropie_packages.sh setup basic_install
      	clear
      	toilet "KickPi-OS" --metal
      	sudo git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
      
      	cd /home/$USER/KickPi-OS/Retropie/
      	sudo unzip -u /home/$USER/KickPi-OS/Retropie/data.zip
      	clear
      	toilet "KickPi-OS" --metal
      	sudo chmod -R 777  /home/$USER/KickPi-OS/Retropie/
      	cp -rf /home/$USER/KickPi-OS/Retropie/roms/* /home/$USER/RetroPie/roms
      	#-----Config Amiberry for Retropie
      	toilet -F gay NOTE!
      	echo " "
      	echo " "
      	echo "The roms and workbench files are under copyrigt! "
      	echo " "
      	echo " "
      	echo "Use only if you have the original!  "
      	echo "(Original Amiga, Amiga Forever,...)"
      	echo " "
      	cd  /home/$USER/RetroPie/
      	git clone --depth=1 https://github.com/archtaurus/RetroPieBIOS.git
      	mv /home/$USER/RetroPie/RetroPieBIOS/BIOS/* /home/$USER/RetroPie/BIOS/
      	sudo chmod -R 777 /home/$USER/RetroPie/RetroPieBIOS/
      	rm -r /home/$USER/RetroPie/RetroPieBIOS/
      	cp $HOME/games/vice/IMAGES/prg/* /home/$USER/RetroPie/roms/c64/    
      	cp -rf /home/$USER/RetroPie/BIOS/kick34005.A500 /home/$USER/Amiga/kickstarts/kick34005.rom
      	cp -rf /home/$USER/RetroPie/BIOS/kick40063.A600 /home/$USER/Amiga/kickstarts/kick40063.rom
      	cp -rf /home/$USER/RetroPie/BIOS/kick40068.A1200 /home/$USER/Amiga/kickstarts/kick40068.rom
      	clear
      	toilet "KickPi-OS" --metal
      	fi
      
      	if [ ! -d /opt/retropie/emulators/amiberry/ ]; then
      	toilet "KickPi-OS" --metal
      	toilet -F gay Amiberry
      	cd /home/$USER/KickPi-OS/Retropie/
      	unzip -u  /home/$USER/KickPi-OS/Retropie/amiberry.zip
      	sudo cp -rf /home/$USER/KickPi-OS/Retropie/amiberry /opt/retropie/emulators/
      	clear
      	toilet "KickPi-OS" --metal
      	toilet -F gay Amiberry
      	cd /home/$USER/KickPi-OS/Retropie/
      	unzip -u  /home/$USER/KickPi-OS/Retropie/amiga.zip
      	sudo cp -rf /home/$USER/KickPi-OS/Retropie/amiga /opt/retropie/configs/
      
      	else 
      	echo " Amiberry already installed..."
      	fi
      
      	if [ ! -d /opt/retropie/libretrocores/lr-vice/ ]; then
      	toilet "KickPi-OS" --metal
      	toilet -F gay C64
      	cd /home/$USER/KickPi-OS/Retropie/
      	unzip -u  /home/$USER/KickPi-OS/Retropie/lr-vice.zip
      	sudo cp -rf /home/$USER/KickPi-OS/Retropie/lr-vice /opt/retropie/libretrocores/    
      	clear
      	toilet "KickPi-OS" --metal
      	toilet -F gay C64
      	cd /home/$USER/KickPi-OS/Retropie/
      	unzip -u  /home/$USER/KickPi-OS/Retropie/c64.zip
      	sudo cp -rf /home/$USER/KickPi-OS/Retropie/c64 /opt/retropie/configs/
      	else 
      	echo " C64 (lr-vice) already installed..."
      	fi     
      	sudo cp -rf /home/$USER/KickPi-OS/Retropie/es_settings.cfg /opt/retropie/configs/all/emulationstation/
      	sudo cp -rf /home/$USER/KickPi-OS/Retropie/es_systems.cfg /etc/emulationstation/
      	cp -rf /home/$USER/.KickPi-OS/config/splash/*  /home/$USER/RetroPie/splashscreens/
      	sudo cp -rf /home/$USER/KickPi-OS/Retropie/splashscreen.list  /etc/
fi     
   
  
      
      if [ "$(getconf LONG_BIT)" == "64" ]; then
          sudo cp -rf /home/$USER/Amiga/amiberry /opt/retropie/emulators/amiberry/
          echo "Amiberry 64 bit for RetroPie"
      
      else 
      clear
      # Configure RetroPi32Bit
       
      fi     
     
      
      if [ ! -f /home/$USER/RetroPie/BIOS/kick20.rom ]; then
      # First deinstall
      echo " "
      
      else 
      clear
      # Configured
      sudo rm /home/$USER/Amiga/kickstarts/kick20.rom
      sudo rm /home/$USER/RetroPie/BIOS/kick20.rom
      fi
      
      sudo chmod -R 777 /home/$USER/.KickPi-OS/
      sudo chmod -R 777 /home/$USER/RetroPie/
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      sudo chmod -R 777 /home/pi/.emulationstation/
      sudo chmod -R 777 /opt/retropie/
      sudo chmod -R 777 /etc/emulationstation/
      
    
      
  
}


#**********************************************  #Finish setup  ***************************************
#****************************************************************************************************************

cd ~

clear
toilet "KickPi-OS" --metal

case $CHOICE in
        
        1)
            #Poser
	    KickPi-OS_Desktop
            KickPi-OS_Tools
            KickPi-OS_Amiberry
            Configure_Amiga
            KickPi-OS_Retropie
	    KickPi-OS_Addons
	    KickPi-OS_Video
            #KickPi-OS_Update
            ;;
        2)
            #Poser
	    KickPi-OS_Desktop
            KickPi-OS_Tools
            KickPi-OS_Amiberry
            Configure_Amiga
            KickPi-OS_Retropie
	    KickPi-OS_Addons
            KickPi-OS_Office
	    KickPi-OS_Video
	    #KickPi-OS_Update
            ;;
        
        3)
           
            #Poser
            KickPi-OS_Tools
            KickPi-OS_Desktop
            KickPi-OS_Amiberry
            Configure_Amiga
	    #KickPi-OS_Update
           
            ;;
                  

esac


echo " "
      echo " "
      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp  /home/$USER/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
      sudo cp  /home/$USER/KickPi-OS/config/rc.local /etc/
      sudo cp  /home/$USER/KickPi-OS/config/login /etc/pam.d/
      sudo rm -rf ~/.local/share/Trash/
      sudo rm -rf ~/.cache/
      
      sudo rm -rf ~/KickPi-OS
      touch ~/.hushlogin
      #sudo rm -rf ~/amigafonts/
      
      
      
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga

clear
toilet "KickPi-OS" --metal
if  xset q &>/dev/null; then
cd
clear
toilet "KickPi-OS" --metal
echo "KickPI-OS ROM Operating System and Libraris" 
echo "Version V1.1 2020-2021 KickPi-OS "
echo "No Rights Reserved.  "
echo ""
echo "Type 'd' to boot into Kick-OS Workbench"
echo ""
echo "1.>  "
echo "1.>  ( a ) Boot to Amiberry if default config exist" 
echo "1.>  ( d ) KickPi Desktop                          " 
echo "1.>  ( e ) Emulationstation              (RetroPie)" 
echo "1.>  ( r ) Emulationstation Setup                  "
echo "1.>  ( u ) KickPi-OS Update                        "
echo "1.>  ( m ) Boot select                             " 
echo "1.>  ( c ) Raspi-Config                            "
echo "1.>  ( s ) Shutdown                                "  
echo ""
	else 
startx
fi
