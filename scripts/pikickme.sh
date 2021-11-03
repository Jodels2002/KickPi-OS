#!/bin/bash
#***********************************************  #PimigaX install script  ***********************************
# Install PimigaX
# B.Titze 2021
#*************************************************************************************************************
      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo "Installing PimigaX Update System ..."
      echo " "
      echo " "

PimigaX.sh
sudo cp -R /home/$USER/PimigaX/scripts/* /usr/local/bin
cp -rf  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
   

clear
if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      toilet "PimigaX" --metal
      toilet "64 bit" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""

      sudo update-rc.d motd remove
    else 
      clear
      toilet "PimigaX" --metal
      toilet "32 bit" --metal
      echo " "
      echo " "
      echo "Raspberry Pi OS 32 bit is running... "
      echo ""
    
      
fi    
      
      echo ""
      echo " "
      echo "1>	Hi Guys,"
      echo " "
      echo "1>	welcome to the "PimigaX" installer! "
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
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
     
#******************************************** #PimigaX mini  Menu ********************************************
#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="PimigaX"
TITLE="Witch PimigaX you want?"
MENU="Please select:"

OPTIONS=(1 "Install PimigaX       (recommended)            (ca. 20 min)"
	 2 "Install PimigaX       + with RetroPie   	     (ca. 30 min)"
         3 "Install PimigaX       all                      (ca. 50 min)")
        

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   
#*********************************************  #OLED & LED comming soon, maybe :)  *****************************
#**********************(crontab -l 2>/dev/null; echo "*/5 * * * * /usr/local/bin/loop.sh") | crontab -***********



OLED() {
if [ ! -d /OLED/ ]; then


       sudo chmod -R 777 /usr/local/bin/
  
       sudo apt-get install -y python3-pip
       pip3 install adafruit-circuitpython-ssd1306
       
       sudo raspi-config nonint do_i2c 0
       sudo chmod -R 777 /home/$USER/Adafruit_Python_SSD1306
       sudo apt install -y python3
       sudo apt install -y python-dev
       sudo apt install -y python-smbus i2c-tools
       sudo apt install -y python-pil
       sudo apt install -y python-pip
       sudo apt install -y python-setuptools 
       sudo apt install -y python-dev
       sudo apt install -y python-smbus i2c-tools
       sudo apt install -y python-pil
       sudo apt install -y python-pip
       sudo apt install -y python-setuptools 
       cd /home/pi
       sudo python -m pip install --upgrade pip setuptools wheel
       sudo pip install Adafruit-SSD1306
       sudo python -m pip install --upgrade pip setuptools wheel
   
       sudo cp -rf /home/pi/PimigaX/OLED/ /
       sudo cp -rf /home/pi/PimigaX/conf/rc.local /etc/
       sudo cp -rf /home/pi/PimigaX/conf/.bashrc /home/pi/
     
 
       
       sudo chmod -R 777 /OLED/
       sudo chmod -R 777 /usr/local/bin/
       sudo chmod -R 777 /etc/rc.local
       sudo chmod -R 777 /home/pi/.bashrc
       (crontab -l 2>/dev/null; echo "*/5 * * * * /usr/local/bin/loop.sh") | crontab -
       
       else 
       clear
       sudo cp -rf /home/pi/PimigaX/OLED/ /
       sudo chmod -R 777 /OLED/
       sudo chmod -R 777 /usr/local/bin/
       fi
       }

#**********************************************  #Install 64 bit pre      ***************************************
#****************************************************************************************************************
  
  
PimigaX_64bit_pre() {

 #Install Retropie/Setup Preinstall
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 
     
    
        sudo apt-get -y purge libraspberrypi-dev 
          	
	sudo apt-get -y remove pulseaudio
	sudo apt-get -y install pulseaudio
	sudo /etc/init.d/alsa-utils reset
	sudo apt-get -y install pi-bluetooth
	sudo apt-get -y install bluez bluez-firmware
	sudo usermod -G bluetooth -a pi

  fi
}
#*********************************************  #Time to update:)  **********************************************
#****************************************************************************************************************

PimigaX_Update() {
      update.sh

      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo " "
      echo "Installing PimigaX Update System ..."
      echo " "

     sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session
     sudo apt purge -y raspberrypi-ui-mods 
     sudo apt purge -y cups cups-client cups-common cups-server-common
     
     sudo apt-get -y upgrade
     
     
       
      
      # Update allways Routine
      if [ ! -d /home/$USER/.PimigaX/ ]; then
#
      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      # Update is running
      rm /home/$USER/Amiga/conf/retroarch.cfg
      
      else 
      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
       
       sudo update-rc.d motd remove
       
      
       
       
      
      fi
       
}

#*********************************************  #Installing PimigaX_Tools*********************************
#**********************************************************************************************************

PimigaX_Tools() {
Update_Tools.sh
      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      echo "            Lets install some usefull Tools:)              "
      echo " "
 

          
      #sudo apt install -y mc zip unzip 
      sudo apt install -y gparted
         
     
      sudo apt install -y git usbmount 
      sudo apt install -y geany geany-plugins-common geany-common xmlstarlet
      
     
     
      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      echo "Some little Amiga stuff...."
      echo " "
      sudo apt-get -y install grafx2 protracker worker 
      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -rf /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
  
      # Preconfigure Worker
      if [ ! -f /home/$USER/.worker/.worker.zip ]; then
      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      cd /home/$USER/PimigaX/.pac/
      unzip -u  /home/$USER/PimigaX/.pac/.worker.zip
      cp -rf /home/$USER/PimigaX/.pac/.worker /home/$USER/
      sudo chmod -R 777 /home/$USER/.worker/
      

      else 
      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      echo " Tools up to date :) "
      # Configured
      
      fi
        
      
}

#*********************************************  #Office  **********************************************
#****************************************************************************************************************

PimigaX_Office() {

      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      echo "            Office Tools:)              "
      echo " "
      
      sudo apt install -y libreoffice   
     
}

#*********************************************  #Video & Graphic  **********************************************
#****************************************************************************************************************

PimigaX_Video() {
Update_Graphic.py
      clear
      toilet "PimigaX" --metal

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
      toilet "PimigaX" --metal

      echo " "
      echo " "
      toilet -F gay PhotoGimp
       
      curl -L "https://github.com/Diolinux/PhotoGIMP/releases/download/1.0/PhotoGIMP.by.Diolinux.v2020.for.Flatpak.zip" -o /home/$USER/PimigaX/PhotoGIMP.zip && unzip /home/$USER/PimigaX/PhotoGIMP.zip -d /home/$USER/PimigaX/ 
      sudo cp -R /home/$USER/PimigaX/PhotoGIMP\ by\ Diolinux\ v2020\ for\ Flatpak/.var/app/org.gimp.GIMP/config/* ~/.config
      echo " PhotoGimp by Diolinux installed..."
      
  
      else 
      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      echo " Gimp is already installed..."
      echo " "
     
      
     
          
      fi     
       
       
      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      
      #sudo apt install -y  kdenlive kdenlive-data inkscape
}

#*********************************************  #Internet  **********************************************
#****************************************************************************************************************

PimigaX_Internet() {

      clear
      toilet "PimigaX" --metal
      toilet -F gay Internet
      echo " "
      echo " "
      echo "            Internet:)              "
      echo " "
      
       
      sudo apt install -y transmission chromium-browser
}
#*********************************************  #Games  **********************************************
#****************************************************************************************************************

PimigaX_Games() {

      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      echo "            Games :)              "
      echo " "
      sudo apt install -y games-finest
     

}

#*********************************************  #Installing PimigaX Desktop*********************************
#**********************************************************************************************************
 
 PimigaX_Desktop() {
 
 PimigaX.sh
 
 #if  xset q &>/dev/null; then
 setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,de,fr,it,gr,dk        
    	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
		echo "PimigaX-OS ROM Operating System and Libraris" 
		echo "Version V1.5 2020-2021 PimigaX "
		echo "No Rights Reserved.  "
		echo ""

	#else 
	  
	
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput xinit
      
  # Preconfigure Silent Boot
      if [ ! -f ~/.backup/rc.local ]; then
    
        clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
      mkdir $HOME/.backup/profile.d
      sudo mv  /etc/rc.local ~/.backup/
      
      sudo cp -rf /home/$USER/PimigaX/config/rc.local /etc/rc.local
      sudo chmod -R 777 /etc/rc.local
      sudo systemctl mask plymouth-start.service
      sudo systemctl mask syslog.service
      sudo systemctl mask cups.service
      sudo systemctl mask cups-browsed.service
      
      else 
        clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
        echo " System optimized :) "
        echo " "
      # Configured
  fi    
          
 
 if [ ! -d $HOME/Desktop ]; then
     # DietPi, Pimiga.... as Host Distri not ready 

      
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
  
      
      
      sudo chmod -R 777 /home/$USER/PimigaX
      sudo chmod -R 777 /home/$USER/.config
      sudo chmod -R 777 ~/.local
      sudo cp -rf ~/PimigaX ~/.PimigaX
      sudo rm -rf /home/$USER/.cache
      cd /home/$USER/PimigaX/
      cp -rf ~/PimigaX/config/Desktop/* /home/$USER/Desktop/

       if [ "$(getconf LONG_BIT)" == "64" ]; then
       
           sudo unzip ~/PimigaX/.pac/.data64.pac
	   cp -rf ~/PimigaX/.data/.config/ /home/$USER/
           cp -rf ~/PimigaX/.data/.local/ /home/$USER/ 
          
          sudo chmod -R 777 /home/$USER/.config/xfce4/panel/
	  
	  else
	   sudo unzip ~/PimigaX/.pac/.data.pac
	   cp -rf ~/PimigaX/.data/.config/ /home/$USER/
           cp -rf ~/PimigaX/.data/.local/ /home/$USER/ 
	  fi

      sudo chmod -R 777 /home/$USER/PimigaX
      sudo chmod -R 777 /home/$USER/.local
      sudo chmod -R 777 /home/$USER/.config
      sudo rm -rf /home/$USER/.cache
      # Fresh install Amiga Desktop
    
if [ ! -f /usr/share/icons/AMIGAOSLINUX.zip ]; then

      cd /usr/share/icons/
      
      sudo cp -rf /home/$USER/PimigaX/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip -u  /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -rf /usr/share/icons/default
      sudo cp -rf /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      
      else 
        clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
        echo " System optimized :) "
        echo " "
fi     

if [ ! -d /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/PimigaX
      git clone --depth=1 https://github.com/x64k/amitk
      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      sudo cp -rf /home/$USER/PimigaX/amitk /usr/share/themes
      
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      clear
      toilet "PimigaX" --metal

      echo " "
      echo " "
      sudo cp -rf /home/$USER/PimigaX/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -rf /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -rf /home/$USER/PimigaX/config/rpd-wallpaper/* /usr/share/backgrounds/
      else 
        clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
        echo " Amiga System look optimized :) "
        echo " "
      
fi

}


#***************************************** # Install Amiberry  *********************************************
#****************************************************************************************************************
     
     
 PimigaX_Amiberry() {
 

  
  Update_Amiberry.sh  
  mkdir /home/$USER/Amiga/
  mkdir /home/$USER/Amiga/conf/ 
     
 
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 
       clear
       toilet "PimigaX" --metal
       toilet -F gay 64bit
       echo " "
       echo " "
       echo " ... here comes Amiberry 64 bit   :-)"
       
      	
	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
    	echo "  ... here comes Amiberry 64 bit :-) "
	
	  cd /home/$USER/PimigaX/Amiga
      	  unzip -u /home/$USER/PimigaX/Amiga/amiberry-rpi4-64bit.zip
	  cp -rf /home/$USER/PimigaX/Amiga/amiberry-rpi4-64bit/* /home/$USER/Amiga/
	  cp -rf /home/$USER/amiberry/*  /home/$USER/Amiga/  
	  cp -rf /home/$USER/PimigaX/Amiga/conf/* /home/$USER/Amiga/conf/ 
  
      else 
      	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
          echo "  ... here comes Amiberry 32 bit :-) "
	  
          cd /home/$USER/PimigaX/Amiga
      	  unzip -u /home/$USER/PimigaX/Amiga/amiberry-rpi4-dmx-32bit.zip 
	  cp -rf /home/$USER/PimigaX/Amiga/amiberry-rpi4-dmx-32bit/* /home/$USER/Amiga/
      

         
      
       fi  
       
      
}


#***************************************** # Configure Amiga *********************************************
#****************************************************************************************************************
     
     
      Configure_Amiga() {
       
             
      cd ~/Amiga
      mkdir /home/$USER/Amiga/conf/ 
      
      if [ ! -d /home/pi/Amiga/dir/WB ]; then
      sudo python3 -m pip install -U pip
      sudo python3 -m pip install -U setuptools
      sudo pip install amitools  
      
      cd /home/pi/Amiga/adf/
      mkdir /home/pi/Amiga/dir/WB
      
     fi 
      
      mkdir /home/pi/Amiga/Install
           
      if [ ! -f /home/$USER/Amiga.zip ]; then
        clear
      	toilet "PimigaX" --metal

      	echo " "
	echo " "
      cd ~
      cp -rf /home/$USER/PimigaX/Amiga/Amiga.zip /home/$USER
      unzip -u ./Amiga.zip
      rm ./Amiga.zip
      
      
      else 
        clear
      	toilet "PimigaX" --metal

      	echo " "
	echo " "
      fi
      if [ ! -f /home/$USER/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "PimigaX" --metal
      toilet "full" --metal
      
      cd /home/pi/Amiga/Install
      
      
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      mv  "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software/" /home/pi/Amiga/dir/
      
        else 
      echo " "
      
      fi
      
      cd /home/$USER/Amiga/hdf
      
      
      if [ ! -d /home/pi/Amiga/dir/System_P96/ ]; then
      
     
      echo " "
      echo " "
      echo "  Configure System_ADVSP ...   " 
      
      mkdir /home/pi/Amiga/dir/System_ADVSP
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_ADVSP.hdf unpack /home/pi/Amiga/dir/System_ADVSP
      
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_ADVSP/System/T/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_ADVSP/System/S/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/ClassicWB-ADVSP.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Software /home/pi/Amiga/dir/System_ADVSP/System/
      
      
      echo " "
      echo " "
      echo "  Configure System_P96 ...   " 
      
      mkdir /home/pi/Amiga/dir/System_P96
      cd "/home/pi/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /home/pi/Amiga/dir/System_P96
      cp -rf /home/pi/Amiga/dir/Workbench31/ /home/pi/Amiga/dir/System_P96/System/T/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/Startup-Sequence /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/User-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/Assign-Startup /home/pi/Amiga/dir/System_P96/System/S/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/Activate /home/pi/Amiga/dir/System_P96/System/S/
      
      cp -rf /home/pi/Amiga/dir/System_ADVSP/System/Temp/* /home/pi/Amiga/dir/System_P96/System/Temp/
      cp -rf /home/pi/.PimigaX/Amiga/ClassicWB/ClassicWB-P96.uae /home/pi/Amiga/conf/
      cp -rf /home/pi/Amiga/dir/Software /home/pi/Amiga/dir/System_P96/System/    
    
      else
      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      fi
      
   
  
  if [ ! -f "/home/$USER/Amiga/dir/AROS/AROS.boot" ]; then
      cd /home/$USER/PimigaX/Amiga
      unzip -u /home/$USER/PimigaX/Amiga/AROS.zip
      mkdir /home/$USER/Amiga/dir/AROS/
     cp -rf /home/$USER/PimigaX/Amiga/AROS/* /home/$USER/Amiga/dir/AROS/
  fi
      cd /home/$USER/Amiga/hdf
      
      cd ~/Amiga
     
      clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
      
      cp -rf /home/$USER/PimigaX/Amiga/conf/* /home/$USER/Amiga/conf/ 
     

      
      
    }    
   

    
#****************************************   #PimigaX_Addons  ****************************************************
#****************************************************************************************************************

PimigaX_Addons() {

if [ "$(getconf LONG_BIT)" == "64" ]; then
     	
	if [ ! -d /home/$USER/games/vice/ ]; then
	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
	echo "Vice64"
     	echo " "
     	echo " "
     	sudo apt install -y autoconf automake build-essential byacc dos2unix flex libavcodec-dev libavformat-dev libgtk2.0-cil-dev libgtkglext1-dev libmp3lame-dev libmpg123-dev libpcap-dev libpulse-dev libreadline-dev libswscale-dev libvte-dev libxaw7-dev subversion yasm libgtk3.0-cil-dev xa65 libsdl2-dev libsdl2-image-dev libgtk-3-dev libglew-dev
     	cd /home/$USER/PimigaX/.pac/
      	unzip -u  /home/$USER/PimigaX/.pac/vice.zip
      	unzip -u  /home/$USER/PimigaX/.pac/Vice2.zip
      	sudo mkdir /home/$USER/games
      	sudo cp -rf /home/$USER/PimigaX/.pac/vice /home/$USER/games
      	sudo cp -rf /home/$USER/PimigaX/.pac/Vice2/* /home/$USER/games/vice/
   
      	sudo chmod -R 777 /home/$USER/games/vice/

       else
  	clear
      toilet "PimigaX" --metal
      echo " "
      echo " "
     	echo "Vice64 always installed"
   
       fi
      
      else 
      	clear
      	toilet "PimigaX" --metal
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
     
     
 fi

}


#**********************************************  #Install Retropie/Setup  ***************************************
#****************************************************************************************************************
  
  
PimigaX_Retropie() {
Update_Retropie.sh
 if [ ! -d "/home/$USER/RetroPie-Setup/" ]; then
 git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
     sudo chmod -R 777 /home/$USER/RetroPie-Setup/
     cd /home/$USER/RetroPie-Setup/ 
 #Install Retropie/Setup Preinstall
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 	
	clear
	toilet "PimigaX" --metal
      	echo " "
      	echo " "
     	echo "RetroPie64 experimental"
     	echo " "
	
     cd
     
    
     git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
     sudo chmod -R 777 /home/$USER/RetroPie-Setup/
     cd /home/$USER/RetroPie-Setup/ 
     sudo __nodialog=1 ./retropie_packages.sh setup basic_install
     
     sudo git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
      
      	cd /home/$USER/PimigaX/Retropie/
      	sudo unzip -u /home/$USER/PimigaX/Retropie/data.zip
	
	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo " "
      	
	sudo chmod -R 777  /home/$USER/PimigaX/Retropie/
      	cp -rf /home/$USER/PimigaX/Retropie/roms/* /home/$USER/RetroPie/roms
      	#-----Config Amiberry for Retropie
      	clear
	toilet -F gay NOTE!
      	echo " "
      	echo " "
      	echo "The roms and workbench files are under copyrigt! "
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
	toilet "PimigaX" --metal
      	echo " "
      	echo " "
      	toilet -F gay Amiberry
	sudo mkdir /opt/retropie/emulators/amiberry
	cd /home/$USER/PimigaX/Retropie/
      	unzip -u  /home/$USER/PimigaX/Retropie/amiga.zip
      	sudo cp -rf /home/$USER/PimigaX/Retropie/amiga /opt/retropie/configs/
	cd /home/$USER/PimigaX/Retropie/
      	unzip -u  /home/$USER/PimigaX/Retropie/amiberry.zip
      	sudo cp -rf /home/$USER/PimigaX/Retropie/amiberry /opt/retropie/emulators/
	sudo cp -rf /home/$USER/PimigaX/Amiga/amiberry /opt/retropie/emulators/amiberry/
	sudo cp -rf /home/$USER/Amiga/capsimg.so /opt/retropie/emulators/amiberry/
	sudo cp -rf /home/$USER/PimigaX/Retropie/es_settings.cfg /opt/retropie/configs/all/emulationstation/
      	sudo cp -rf /home/$USER/PimigaX/Retropie/es_systems.cfg /etc/emulationstation/
	
	cd ~/RetroPie/retropiemenu/
	rm "Auto-Amiga Install.sh"
	wget https://raw.githubusercontent.com/HoraceAndTheSpider/RetroPieAmigaSetup/master/Auto-Amiga%20Install.sh
	chmod +x "Auto-Amiga Install.sh"
	
	sudo chmod -R 777 /opt/retropie/emulators/amiberry/
	sudo chmod -R 777 /opt/retropie/configs/amiga
	
	
     else
     
     	clear
     	toilet "PimigaX" --metal
     	echo " "
     	echo " "
     	echo "RetroPie64 always installed"
     	echo " "
     
     fi
     
          
   
     
  else 
  
      
      sudo apt install -y omxplayer chromium-codecs-ffmpeg   
      	if [ ! -f "/home/$USER/RetroPie-Setup/retropie_packages.sh" ]; then     
      	
	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo "  ... here comes Retropie :-)     "   
      	echo " "
      
      	sudo rm /etc/emulationstation/
      	sudo rm/opt/retropie/
      
      	mkdir /home/$USER/RetroPie/
      	mkdir /home/$USER/RetroPie/BIOS/
      	mkdir /home/$USER/RetroPie/splashscreens/
      	mkdir /home/$USER/RetroPie/roms
      
      	cd
     
      	cd /home/$USER/RetroPie-Setup/ 
      	sudo __nodialog=1 ./retropie_packages.sh setup basic_install
      	
	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo "  ... here comes Retropie :-)     "   
      	echo " "
      	
	sudo git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
      
      	cd /home/$USER/PimigaX/Retropie/
      	sudo unzip -u /home/$USER/PimigaX/Retropie/data.zip
	
      	clear
      	toilet "PimigaX" --metal
      	echo " "
      	echo "  ... here comes Retropie :-)     "   
      	echo " "
      	
	sudo chmod -R 777  /home/$USER/PimigaX/Retropie/
      	cp -rf /home/$USER/PimigaX/Retropie/roms/* /home/$USER/RetroPie/roms
      	#-----Config Amiberry for Retropie
	clear
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
      	toilet "PimigaX" --metal
      	echo " "
      	echo "  ... here comes Retropie :-)     "   
      	echo " "
      	
	fi
      
      	if [ ! -d /opt/retropie/emulators/amiberry/ ]; then
      	
	clear
      	toilet "PimigaX" --metal
	toilet -F gay Amiberry
      	echo " "
      	echo "  ... here comes Retropie :-)     "   
      	echo " "
      	
      	cd /home/$USER/PimigaX/Retropie/
      	unzip -u  /home/$USER/PimigaX/Retropie/amiberry.zip
      	sudo cp -rf /home/$USER/PimigaX/Retropie/amiberry /opt/retropie/emulators/
      	
	clear
      	toilet "PimigaX" --metal
	toilet -F gay Amiberry
      	echo " "
      	echo "  ... here comes Retropie :-)     "   
      	echo " "
      	
	cd /home/$USER/PimigaX/Retropie/
      	unzip -u  /home/$USER/PimigaX/Retropie/amiga.zip
      	sudo cp -rf /home/$USER/PimigaX/Retropie/amiga /opt/retropie/configs/
      
      	else 
	clear
      	toilet "PimigaX" --metal
      	echo " "
       	echo " "
      	echo " Amiberry already installed..."
      	fi
      
      	if [ ! -d /opt/retropie/libretrocores/lr-vice/ ]; then
      	toilet "PimigaX" --metal
      	toilet -F gay C64
      	cd /home/$USER/PimigaX/Retropie/
      	unzip -u  /home/$USER/PimigaX/Retropie/lr-vice.zip
      	sudo cp -rf /home/$USER/PimigaX/Retropie/lr-vice /opt/retropie/libretrocores/    
      	
	clear
      	toilet "PimigaX" --metal
	toilet -F gay C64
      	echo " "
       	echo " "
      	
	cd /home/$USER/PimigaX/Retropie/
      	unzip -u  /home/$USER/PimigaX/Retropie/c64.zip
      	sudo cp -rf /home/$USER/PimigaX/Retropie/c64 /opt/retropie/configs/
      	else 
	clear
      	toilet "PimigaX" --metal
	echo " "
       	echo " "
      	echo " C64 (lr-vice) already installed..."
	echo " "
      	fi     
      	sudo cp -rf /home/$USER/PimigaX/Retropie/es_settings.cfg /opt/retropie/configs/all/emulationstation/
      	sudo cp -rf /home/$USER/PimigaX/Retropie/es_systems.cfg /etc/emulationstation/
      	cp -rf /home/$USER/.PimigaX/config/splash/*  /home/$USER/RetroPie/splashscreens/
      	sudo cp -rf /home/$USER/PimigaX/Retropie/splashscreen.list  /etc/
fi     
   
  
      
      if [ "$(getconf LONG_BIT)" == "64" ]; then
      
         	clear
      		toilet "PimigaX" --metal
		toilet -F gay C64
      		echo " "
       		echo " "
	        echo "Amiberry 64 bit for RetroPie"
	  	echo " "
		
          sudo cp -rf /home/$USER/PimigaX/Amiga/amiberry /opt/retropie/emulators/amiberry/
	  sudo cp -rf /home/$USER/Amiga/capsimg.so /opt/retropie/emulators/amiberry/
	  sudo chmod -R 777 /opt/retropie/emulators/amiberry/
      else 
        clear
      	toilet "PimigaX" --metal
	echo " "
       	echo " "
        clear
      # Configure RetroPi32Bit
       
      fi     
     
      
      if [ ! -f /home/$USER/RetroPie/BIOS/kick20.rom ]; then
      # First deinstall
        clear
      	toilet "PimigaX" --metal
	echo " "
       	echo " "
      
      
      else 
      clear
      	toilet "PimigaX" --metal
	echo " "
       	echo " "
     
      # Configured
      sudo rm /home/$USER/Amiga/kickstarts/kick20.rom
      sudo rm /home/$USER/RetroPie/BIOS/kick20.rom
      fi
      
      sudo chmod -R 777 /home/$USER/.PimigaX/
      sudo chmod -R 777 /home/$USER/RetroPie/
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      sudo chmod -R 777 /home/$USER/.emulationstation/
      sudo chmod -R 777 /opt/retropie/
      sudo chmod -R 777 /etc/emulationstation/
      
    
      
  
}


#**********************************************  #Finish setup  ***************************************
#****************************************************************************************************************

cd ~

clear
      		toilet "PimigaX" --metal

      		echo " "
      		echo " "

case $CHOICE in
        
        1)
            OLED
	    PimigaX_Update
	    PimigaX_64bit_pre
	    PimigaX_Desktop
            PimigaX_Tools
	    PimigaX_Internet
            PimigaX_Amiberry
            Configure_Amiga
        
            
            ;;
        2)
            OLED
	    PimigaX_Update
	    PimigaX_64bit_pre
	    PimigaX_Desktop
            PimigaX_Tools
            PimigaX_Amiberry
            Configure_Amiga
            PimigaX_Retropie
	    PimigaX_Addons
	    PimigaX_Internet
            #PimigaX_Office
	    #PimigaX_Video
	    
            ;;
        
        3)
           
            OLED
	    PimigaX_Update
	    PimigaX_64bit_pre
	    PimigaX_Desktop
            PimigaX_Tools
            PimigaX_Amiberry
            Configure_Amiga
            PimigaX_Retropie
	    PimigaX_Addons
            PimigaX_Office
	    PimigaX_Video
	    #PimigaX_Games
            PimigaX_Internet
            
            ;;
                  

esac



      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp  /home/$USER/PimigaX/scripts/.bashrc /home/$USER/.bashrc
      sudo cp  /home/$USER/PimigaX/config/rc.local /etc/
      sudo cp  /home/$USER/PimigaX/config/login /etc/pam.d/
      sudo rm -rf ~/.local/share/Trash/
      sudo rm -rf ~/.cache/
      
      sudo rm -rf ~/PimigaX
      touch ~/.hushlogin
      #sudo rm -rf ~/amigafonts/
      
      
      
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga

clear
      		toilet "PimigaX" --metal

      		echo " "
      		echo " "
		PimigaX.sh
		
if  xset q &>/dev/null; then
cd
clear
toilet "Pimiga" --metal
echo "Pimiga-OS ROM Operating System and Libraries" 
echo "Version V1.5 2020-2021 PimigaX "
echo "No Rights Reserved.  "
echo ""
echo "Type 'd' to boot into Kick-OS Workbench"
echo ""
echo "1.>  "
echo "1.>  ( a ) Boot to Amiberry if default config exist" 
echo "1.>  ( d ) Pimiga Desktop                          " 
echo "1.>  ( e ) Emulationstation              (RetroPie)" 
echo "1.>  ( r ) Emulationstation Setup                  "
echo "1.>  ( u ) Pimiga Update                        "
echo "1.>  ( m ) Boot select                             " 
echo "1.>  ( c ) Raspi-Config                            "
echo "1.>  ( s ) Shutdown                                "  
echo ""
	else 

startx
fi
