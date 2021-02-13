#!/bin/bash
#***********************************************  #KickPi-OS install script  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************
## PWR-LED (green) 
#dtoverlay = pwr-led, gpio = 17
# HDD LED (orange)
#dtoverlay = act-led, gpio = 27


#************************************************  #Amiberry Version   ************************************************
#Amiberry32=amiberry-v3.3-rpi4-dmx-32bit.zip
#Amiberry64=amiberry-v3.3-rpi4-64bit.zip

#***********************************************  #Are you runing Desktop?  ***********************************
if  xset q &>/dev/null; then
    echo "Please dont´t run this script under Linux Desktop" >&2
    sleep 15s
    exit 1
fi 

#***********************************************  #Preinstall stuff *****************************************
#*************************************************************************************************************
sudo apt-mark hold lxpanel
 
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
cp -rf  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
sudo apt-get install -y toilet dialog 
clear
if [ "$(getconf LONG_BIT)" == "64" ]; then
      clear
      echo "Raspberry Pi OS 64 bit is running..."
      echo ""
      toilet "KickPi-OS 64 bit" --metal
      
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
      sleep 3s
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

OPTIONS=(1 "Install KickPi-OS full  (recommended)           (ca. 50 min)"
	 2 "Install KickPi-OS full + Office Suite           (ca. 70 min)"
         3 "Install KickPi-OS light                         (ca. 30 min)")
        

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

          
      sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
      sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      sudo apt install -y  geany geany-plugins-common geany-common zip  unzip xmlstarlet mc
      
      clear
      toilet "KickPi-OS" --metal
      
      #Some little Amiga stuff....
      sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms 
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -rf /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
  
      
}

#*********************************************  #Office  **********************************************
#****************************************************************************************************************

KickPi-OS_Office() {

      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      sudo apt install -y imagemagick krita-l10n gparted synaptic
      sudo apt install -y thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk

}


#*********************************************  #Installing KickPi-OS Desktop*********************************
#**********************************************************************************************************
 
 KickPi-OS_Desktop() {
 
 if [ ! -d $HOME/Desktop ]; then
     # DietPi, Pimiga.... as Host Distri not ready 

      sudo apt install -y git chromium-browser usbmount gparted synaptic
    
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
  
      sudo apt purge -y lxde  lxde-common lxde-core
      sudo apt purge -y raspberrypi-ui-mods
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
      
      
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
      clear
fi     

if [ ! -f /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/KickPi-OS
      git clone --depth=1 https://github.com/x64k/amitk
      sudo cp -rf /home/$USER/KickPi-OS/amitk /usr/share/themes
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      sudo cp -rf /home/$USER/KickPi-OS/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -rf /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -rf /home/$USER/KickPi-OS/config/rpd-wallpaper/* /usr/share/backgrounds/
      else 
      clear
      
fi
  
  
     
  
  if [ $USER == "pi" ]; then
     

      # Settings XFCE4 Rasperry OS
      
   
       cp -rf ~/KickPi-OS/.data/.config/ /home/$USER/
       cp -rf ~/KickPi-OS/.data/.local/ /home/$USER/  
       sudo raspi-config nonint do_boot_behaviour B4
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
               cp -rf ~/KickPi-OS/.data/.local/ /home/$USER/
               sudo rm -rf /home/$USER/.config
               
               
                cd  /home/amibian/KickPi-OS/.pac/amibian/
                unzip -u /home/amibian/KickPi-OS/.pac/amibian/.config.zip
                unzip -u /home/amibian/KickPi-OS/.pac/amibian/.local.zip
                cp -rf /home/amibian/KickPi-OS/.pac/amibian/.config/ /home/$USER/
                cp -rf /home/amibian/KickPi-OS/.pac/amibian/.local/ /home/$USER/  
                sudo rm -rf  /home/amibian/.config/autostart/
                cd ~
                mkdir /home/amibian/Amiga/conf/ 
                cp -rf /home/amibian/KickPi-OS/Amiga/amibian/conf/* /home/amibian/Amiga/conf/
                cp -rf /home/amibian/KickPi-OS/Amiga/amibian/conf/* /home/amibian/Amiga/Emulators/amiberry/conf/
                cp -rf /home/amibian/KickPi-OS/Amiga/amibian/conf/* /home/amibian/Amiga/Emulators/amiberry-dev/conf/
fi 


}


#***************************************** # Install Amiberry  *********************************************
#****************************************************************************************************************
     
     
 KickPi-OS_Amiberry() {
  
      
 
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 
       echo " "
       echo " "
       echo "  ... here comes Amiberry 64 bit :-) "
       
       
       clear
       toilet "KickPi-OS" --metal
       toilet -F gay 64bit
       echo " "
       echo " "
        echo " ... here comes Amiberry 64 bit   :-)"
       
      cd /home/$USER/KickPi-OS/Amiga
		unzip -u /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-64bit.zip 
		cp -rf /home/$USER/KickPi-OS/Amiga/amiberry-rpi4-64bit/* /home/$USER/Amiga
		cp -rf /home/$USER/KickPi-OS/Amiga/amiberry /home/$USER/Amiga/
		sudo chmod -R 777 /home/$USER/amiberry
       
       
      
      
      cp -rf /home/$USER/KickPi-OS/Amiga/amiberry /home/$USER/Amiga/
      
 
       
    else
    
       echo " ... here comes Amiberry 32 bit   :-)"
      
   
	  cd /home/$USER/KickPi-OS/Amiga
      	  unzip -u /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-dmx-32bit.zip 
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
      clear
      toilet "KickPi-OS" --metal
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
     
      else 
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip -u ./ClassicWB_68K_v28.zip
    
      fi
      
      if [ ! -f "/home/$USER/Amiga/hdf/workbench-311.hdf" ]; then
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo " "
      echo "  Configure AmigaForever workbench-311 ...     " 
      echo " "
      echo " "
      
      fi
  
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
      if [ ! -f /home/$USER/Amiga/Amiga_roms.zip ]; then
      clear
      toilet -F gay NOTE!
      echo " "
      echo " "
      echo "The roms and workbench files are under copyrigt! "
      echo " "
      echo " "
      echo "Use only if you have the original!  "
      echo " (Original Amiga, Amiga Forever,..."
      echo " "
      echo "The structure in the "Amiga" folder is adapted to Amiga Forever."
      echo " "
      echo " "
      sleep 5s
      wget https://misapuntesde.com/res/Amiga_roms.zip
      cp -rf ./Amiga_roms.zip /home/$USER/Amiga/kickstarts/
      cd ~/Amiga/kickstarts/
      unzip -u ./Amiga_roms.zip
      rm ./Amiga_roms.zip
      fi
        

      
      
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
 cd /home/$USER/Amiga/hdf
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full 64bit" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      else 
      clear
      
      fi
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full 64bit" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_OS39_v28 ...   KickPi-OS full  " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip -u ./ClassicWB_OS39_v28.zip
      else 
      clear
      
      fi
      
 
else 
      cd /home/$USER/Amiga/hdf
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      else 
      clear
      
      fi
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  ClassicWB_OS39_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip -u ./ClassicWB_OS39_v28.zip
      else 
      clear
      fi
     clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "Commodore Vice" 
      echo " "
      echo " "
      cd
      if [ ! -f /home/$USER/games/vice-3.4-bin-rpi.tar.gz ]; then
      
      mkdir $HOME/games
      cd $HOME/games
      wget https://misapuntesde.com/rpi_share/vice-3.4-bin-rpi.tar.gz
      tar xzf  ./vice-3.4-bin-rpi.tar.gz
      #rm ./vice-3.4-bin-rpi.tar.gz
     
      else 
      clear
            fi
      
    
    #Install PiKISS
      cd
      git clone --depth=1 https://github.com/jmcerrejon/PiKISS
      sudo chmod -R 777 /home/$USER/PiKISS
      cd PiKISS
      
      #./piKiss.sh
      cd ~/KickPi-OS/config/
      
     
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      ./retro-term.sh
      
      
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
     
      
      
 fi
}

     
#**********************************************  #Install Retropie/Setup  ***************************************
#****************************************************************************************************************
  
  
KickPi-OS_Retropie() {
#Install Retropie/Setup

      
    if [ "$(getconf LONG_BIT)" == "64" ]; then
   
      clear
       toilet "KickPi-OS" --metal
       toilet -F gay 64bit
      echo " "
      echo " "
      echo "Sorry, Retropie dosn´t support 64 bit OS... (-:     "   

      
    else
if [ ! -f "/opt/retropie/supplementary/emulationstation/emulationstation" ]; then     
    echo " "
      clear
      toilet "KickPi-OS" --metal
      echo " "
      echo "  ... here comes Retropie :-)     "   
      echo " "
      echo " "
      cd
      git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      cd /home/$USER/RetroPie-Setup/ 
      sudo __nodialog=1 ./retropie_packages.sh setup binaries
      #Amibian dosen´t install "Binary" !?!
      #if [ $USER == "pi" ]; then
      sudo __nodialog=1 ./retropie_packages.sh setup basic_install
      #fi
      clear
      toilet "KickPi-OS" --metal
      sudo git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
      
      cd /home/$USER/KickPi-OS/Retropie/
      sudo unzip -u /home/$USER/KickPi-OS/Retropie/data.zip
      cp -rf /home/$USER/KickPi-OS/Retropie/roms/* /home/$USER/RetroPie/roms
      #unzip -u /home/$USER/KickPi-OS/Retropie/all.zip
      #sudo cp -R /home/$USER/KickPi-OS/Retropie/all/* /opt/retropie/configs/
      cp $HOME/games/vice/IMAGES/prg/* /home/$USER/RetroPie/roms/c64/    
      
      
      
      if [ ! -f /home/$USER/RetroPie/BIOS/extract_to_sytem_folder.zip ]; then
      clear
      toilet -F gay Retropie 
      echo " "
      echo " "
      echo "  Add Retropie Bios Files from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/BIOS/
      wget https://archive.org/download/retroarch_bios_pack/extract_to_sytem_folder.zip
      unzip -u /home/$USER/RetroPie/BIOS/extract_to_sytem_folder.zip
      #rm /home/$USER/KickPi-OS/Retropie/Romset.zip
      fi
      else 
      clear
      
      fi
      #-----Config Amiberry for Retropie
  
      
      sudo cp -rf /home/$USER/Amiga/kickstarts/* /home/$USER/RetroPie/BIOS/
      
      sudo cp -rf /home/$USER/KickPi-OS/Retropie/es_settings.cfg /opt/retropie/configs/all/emulationstation/
      sudo cp -rf /home/$USER/KickPi-OS/Retropie/es_systems.cfg /etc/emulationstation/
      cp -rf /home/$USER/KickPi-OS/config/KickPi-OS.mp4  /home/$USER/RetroPie/splashscreens/
      sudo cp -rf /home/$USER/KickPi-OS/Retropie/splashscreen.list  /etc/
      
      
      sudo chmod -R 777 /home/$USER/RetroPie/
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      sudo chmod -R 777 /opt/retropie/
      sudo chmod -R 777 /etc/emulationstation/
      
    
 fi      
  
}


#**********************************************  #Finish setup  ***************************************
#****************************************************************************************************************

cd ~

clear
toilet "KickPi-OS" --metal

case $CHOICE in
        
        1)
            #Poser
            KickPi-OS_Tools
            KickPi-OS_Desktop
            KickPi-OS_Amiberry
            Configure_Amiga
            KickPi-OS_Addons
            KickPi-OS_Retropie
            KickPi-OS_Update
       ;;
        2)
            #Poser
            KickPi-OS_Tools
            KickPi-OS_Desktop
            KickPi-OS_Amiberry
            Configure_Amiga
            KickPi-OS_Addons
            KickPi-OS_Retropie
            KickPi-OS_Office 
	    KickPi-OS_Update
       ;;
        
        3)
           
            #Poser
            KickPi-OS_Tools
            KickPi-OS_Desktop
            KickPi-OS_Amiberry
            Configure_Amiga
	    KickPi-OS_Update
           
       ;;
                  

esac


echo " "
      echo " "
      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp  /home/$USER/KickPi-OS/scripts/.bashrc /home/$USER/.bashrc
      sudo rm -rf ~/.local/share/Trash/
      sudo rm -rf ~/.cache/
      sudo rm -rf ~/.config/chromium/
      sudo rm -rf ~/KickPi-OS
      sudo rm -rf ~/amigafonts/
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga

clear
toilet "KickPi-OS" --metal

startx
