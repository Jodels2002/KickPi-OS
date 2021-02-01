#!/bin/bash
# Install PiKickOS
# B.Titze 2020
## PWR-LED (green) 
#dtoverlay = pwr-led, gpio = 17
# HDD LED (orange)
#dtoverlay = act-led, gpio = 27
#https://archive.org/compress/Amiga_WHD_Games
# https://github.com/billw2/rpi-clone "rpi-clone -f -p 256M sdb"
# Todo: Em neut, AFor strukt, Rena pro  . Boot Co ...Spe,  Cat Boo, AWallWal, Ami Tur 

#******************************************** #History ************* ****************************************
#************************************************************************************************************

# 11.01.2021 Amibian update & Settings Ok 
# 11.01.2021 PiKiss OK -> todo CoolTerm, Certificates 
# 18.01 Menu & Funktions
# 25.01 Amiga XFCE4 Desktop, OLED, bugfix
# 26.01 added Convert Raspberry Pi OS to PiKickOS (32bit)
# 26.01 added Convert Raspberry Pi OS 64 bit to PiKickOS - 64bit
# funktions and structure Test 32/64bit OK

#***********************************************  #Preinstall stuff *****************************************
#*************************************************************************************************************

sudo rm -rf /home/$USER/.local/share/Trash/*
  
  if [ "$(getconf LONG_BIT)" == "64" ]; then
 
     OS="Raspberry Pi OS 64 bit"
       
    else
    OS="Raspberry Pi OS 32 bit"
 fi     

Amiberry32=amiberry-v3.3-rpi4-dmx-32bit.zip
Amiberry64=amiberry-v3.3-rpi4-64bit.zip

      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      


#***********************************************  #Are you runing Desktop?  ***********************************
if  xset q &>/dev/null; then
    echo "No X server at \$DISPLAY [$DISPLAY]" >&2
    sleep 15s
    exit 1
fi 
#***********************************************  #Ok, we are ready...  ***************************************

sudo apt-mark hold lxpanel
#sudo apt-get -y update 
sudo apt install -y toilet dialog mc git 


clear
toilet -F gay PiKickOS
toilet -F gay **********

" "
      echo " "
      echo "Now we start to convert $OS " 
      echo " "
      echo " One Question please..."
      echo " This will take time... relex.... "
      sleep5

#******************************************** #PiKickOS mini  Menu ********************************************
#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="PiKickOS"
TITLE="Main Menu"
MENU="Please select:"

OPTIONS=(1 "Convert Pi OS (32/64 bit) to PiKickOS"
         2 "Convert to PiKickOS, Retropie"
         3 "Convert to PiKickOS, Retropie, OlED & LED ")
        

CHOICE=$(dialog --clear \
                --backtitle "$PiKickOS" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
   echo " Okey, fine ..this will take time... relex.... "
      sleep5             
                
#*********************************************  #OLED & LED comming soon, maybe :)  *****************************
#****************************************************************************************************************

Poser() {

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

#its ok but dissabled
#cd /home/$USER/.PiKickOS/OLED
#sudo chmod -R 777 /home/$USER/.PiKickOS/OLED


# Test OLED
#i2cdetect -y 1
#echo " Should Say: "3C""
#python Amiga.py

cd /home/$USER/.PiKickOS/LED
#python LED.py


}
#*********************************************  #Time to update:)  **********************************************
#****************************************************************************************************************

Pimiga_Update() {

      clear
      toilet -F gay PiKickOS

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo " "
      echo "Installing PiKickOS Update System ..."
      echo " "
      echo " "
      sudo apt-get -y upgrade

}



#*********************************************  #Installing PiKickOS_Tools*********************************
#**********************************************************************************************************

Pimiga_Tools() {

      clear
      toilet -F gay PiKickOS

      echo " "
      echo " "
      echo "            Lets install some usefull Tools:)              "
      echo " "
      echo " "

      
      
      sudo apt-get install libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
     
      # Test
      #sudo apt-get install -y libfreetype6-dev libgl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libjpeg-dev libtiff-dev libwebp-dev  build-essential
      sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      sudo apt install -y  geany geany-plugins-common geany-common 
      #sudo apt install -y imagemagick gparted firefox-esr  krita-l10n
      
      
      clear
      toilet -F gay PiKickOS
      
      #Some little Amiga stuff....
      sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms
      clear
      toilet -F gay PiKickOS
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -R /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
      sudo cp -R /home/$USER/.PiKickOS/scripts/* /usr/local/bin
      
}



#*********************************************  #Installing PiKickOS Desktop*********************************
#**********************************************************************************************************
 
 Pimiga_Desktop() {
 
      clear
      toilet -F gay PiKickOS 
   
      echo "Installing PiKickOS Desktop ..."
      echo " "
      echo " "
      
      # Fresh install XFCE4
      sudo apt purge -y lxde raspberrypi-ui-mods lxde-common lxde-core
      #Test! sudo apt purge -y xorg xserver-xorg lxde raspberrypi-ui-mods lxde-common lxde-core
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
      #sudo apt install -y thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk
      
      sudo chmod -R 777 /home/$USER/PiKickOS
      
      #sudo rm -rf ~/.config
      #mkdir ~/.config
      sudo chmod -R 777 /home/$USER/.config
      #sudo rm -rf /home/$USER/.local
      #mkdir ~/.local
      sudo chmod -R 777 ~/.local
      sudo cp -R ~/PiKickOS ~/.PiKickOS
      cd /home/$USER/PiKickOS/


      sudo unzip ~/PiKickOS/.pac/.data.pac

      
      cp -R ~/PiKickOS/.data/.config/ /home/$USER/
      cp -R ~/PiKickOS/.data/.local/ /home/$USER/
      sudo chmod -R 777 /home/$USER/PiKickOSPiKickOS
      sudo chmod -R 777 /home/$USER/.local
      sudo chmod -R 777 /home/$USER/.config
      
      # Fresh install Amiga Desktop
    
if [ ! -f /usr/share/icons/AMIGAOSLINUX.zip ]; then

      cd /usr/share/icons/
      sudo cp -R /home/$USER/PiKickOS/Amiga_Logos /usr/share/icons
      sudo cp -R /home/$USER/PiKickOS/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -rf /usr/share/icons/default
      sudo mv /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      else 
      clear
fi     

if [ ! -f /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/PiKickOS/Amiga_Logos
      git clone --depth=1 https://github.com/x64k/amitk
      sudo cp -R /home/$USER/PiKickOS/Amiga_Logos/amitk /usr/share/themes
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      sudo mv /home/$USER/PiKickOS/Amiga_Logos/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -R /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -R /home/$USER/PiKickOS/config/rpd-wallpaper/* /usr/share/backgrounds/
      else 
      clear
      
fi
      
}



#***************************************** # Install Amiberry  *********************************************
#****************************************************************************************************************
     
     
 Pimiga_Amiberry32() {
 
 clear
      toilet -F gay PiKickOS
      
      echo " "
      echo " "
      echo "  ... here comes Amiberry   :-)   " 
      echo " "
      echo " "  
      cd ~
      mkdir /home/$USER/Amiga
 
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 
       echo " "
       echo " "
       echo "  ... here comes Amiberry 64 bit :-) "
       
       sudo apt-get install -y libfreetype6-dev libgl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libjpeg-dev libtiff-dev libwebp-dev  build-essential
       clear
       toilet -F gay PiKickOS 64bit
       
       sudo apt-get install -y  libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
       clear
       toilet -F gay PiKickOS 64bit
       
       cd /home/$USER
       
       git clone https://github.com/midwan/amiberry
       cd ~/amiberry
       make -j2 PLATFORM=pi64
       
       clear
       toilet -F gay PiKickOS 64bit
       sudo chmod +x /home/$USER/amiberry/amiberry
       cp -R /home/$USER/amiberry/* /home/$USER/Amiga
       sudo chmod +x /home/$USER/Amiga/amiberry
       
    else
    
       echo" ... here comes Amiberry 32 bit   :-)"
       
      cd /home/pi/PiKickOS/Amiga
      unzip /home/pi/PiKickOS/Amiga/amiberry-v3.3-rpi4-dmx-32bit.zip 
      cp -r /home/pi/PiKickOS/Amiga/amiberry-rpi4-dmx-32bit/* /home/$USER/Amiga
    fi
    
    
}


     

#***************************************** # Configure Amiga *********************************************
#****************************************************************************************************************
     
     
      Configure_Amiga() {
       
             
      cd ~/Amiga
      clear
      toilet -F gay PiKickOS
      echo " "
      echo "  ... lets configer ClassicWB" 
      echo " "
      echo " " 
      echo "  ... downloading  ClassicWB"  
      echo " "
      echo " "
      
      cd ~
      cp -R /home/$USER/PiKickOS/Amiga/Amiga.zip /home/$USER
      unzip ./Amiga.zip
      rm -rf ./Amiga.zip
      
      cd /home/$USER/Amiga/hdf
      
      #if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      #clear
      #toilet -F gay PiKickOS
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...     " 
      echo " "
      echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      #unzip ./ClassicWB_UAE_v28.zip
      #else 
      clear
      toilet -F gay PiKickOS
      #fi
      
      #if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_P96_v28.zip ]; then
      #clear
      #toilet -F gay PiKickOS
      echo " "
      echo " "
      echo "  Configure ClassicWB_P96_v28 ...     " 
      echo " "
      echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_P96_v28.zip
      #unzip ./ClassicWB_P96_v28.zip
      #else 
      clear
      toilet -F gay PiKickOS
      #fi
      
      #if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip ]; then
      #clear
      #toilet -F gay PiKickOS
      echo " "
      echo " "
      echo "  Configure ClassicWB_OS39_v28 ...     " 
      echo " "
      echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      #unzip ./ClassicWB_OS39_v28.zip
      #else 
      clear
      toilet -F gay PiKickOS
      #fi
      cd /home/$USER/Amiga/hdf
      if [ ! -f "/home/$USER/Amiga/HDF/ClassicWB_68K_v28.zip" ]; then
      clear
      toilet -F gay PiKickOS
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip ./ClassicWB_68K_v28.zip
      else 
      clear
      toilet -F gay PiKickOS
     
      
      fi

    
      
      cd /home/$USER/Amiga/hdf
      
      cd ~/Amiga
      clear
      toilet -F gay PiKickOS
   
      echo " "
      echo " "
      if [ ! -f /home/$USER/Amiga/Amiga_roms.zip ]; then
      clear
      echo " "
      echo " "
      echo "The roms and workbench files are under copyrigt! "
      echo " "
      echo "Use only if you have the original!  "
      echo " (Original Amiga, Amiga Forever,..."
      echo " "
      echo " Be fair and honest!"
      sleep 4s
      wget https://misapuntesde.com/res/Amiga_roms.zip
      mv ./Amiga_roms.zip /home/$USER/Amiga/kickstarts/
      cd ~/Amiga/kickstarts/
      unzip ./Amiga_roms.zip
      toilet -F gay PiKickOS
      else 
      clear
      toilet -F gay NOTE!
      
     
    
      fi
      
     
      
      toilet -F gay PiKickOS
      echo " "
      echo " "
      
      
      mv /home/$USER/PiKickOS/Amiga/conf/* /home/$USER/Amiga/conf  

      sudo chmod -R 777 /home/$USER/Amiga
    
}    
   

       
#*********************************************  # Amibian  **********************************************
#********************************************# Not testet! *******************************************************

 Amibian() {
 
      echo "Backup Settings...."

      echo " "
      echo " "
 
      mkdir /home/$USER/.backup/
      sudo chmod -R 777 ~/.backup/
      cp -R ~/.config/ ~/.backup/.config
      cp -R ~/.local/ ~/.backup/.local
      cp -R /usr/local/bin ~/.backup/usr
     
     
}

    
#****************************************   #Install PiKISS  ****************************************************
#****************************************************************************************************************

Pimiga_Addons() {
     #Install PiKISS
      
      clear
      toilet -F gay PiKickOS
      
      echo " "
      echo " "
      echo "  ... here comes PiKiss  :-)   "     
      echo " "
      echo " "
      cd ~
      git clone --depth=1 https://github.com/jmcerrejon/PiKISS

      cd PiKISS
      sudo chmod -R 777 ./piKiss.sh
      clear
      toilet -F gay PiKickOS
      echo " "
      echo " "
     
      #sudo ./piKiss.sh 
      
}

     
#**********************************************  #Install Retropie/Setup  ***************************************
#****************************************************************************************************************
  
  
Pimiga_Retropie() {
#Install Retropie/Setup
      
      clear
      toilet -F gay PiKickOS
      
      echo " "
      echo " "
      echo "  ... here comes Retropie :-)     "   
      echo " "
      echo " "
      cd ~
      sudo apt-get install -y git dialog unzip xmlstarlet
      git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      cd  /home/$USER/RetroPie-Setup

      sudo __nodialog=1 ./retropie_packages.sh setup basic_install
      clear
      toilet -F gay PiKickOS
      sudo __nodialog=1 ./retropie_packages.sh setup amiberry
      clear
      toilet -F gay PiKickOS
      sudo __nodialog=1 ./retropie_packages.sh setup vice
      sudo _clear
      toilet -F gay PiKickOS
      sudo _nodialog=1 ./retropie_packages.sh setup lr-vice
      clear
      toilet -F gay PiKickOS
      #sudo __nodialog=1 ./retropie_packages.sh setup giana
      clear
      toilet -F gay PiKickOS
      #sudo __nodialog=1 ./retropie_packages.sh setup eduke32
      
      
      
      
      
}


#**********************************************  #Finish setup  ***************************************
#****************************************************************************************************************

cd ~

clear
toilet -F gay PiKickOS

case $CHOICE in
        1)
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Configure_Amiga
            ;;
        2)
             
   if whiptail --yesno "Would you create a Boot-USB-Stick from SD Card?" 20 60 ;then
    /home/$USER/PiKickOS/scripts/rpi-clone -u sda
else
    echo No
fi
   clear
   echo " "


         3 "PiKickOS, Retropie, OlED & LED ")
        
            echo "PiKickOS, Retropie"
            #Poser
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_Addons
            #Pimiga_Amiberry
            Configure_Amiga
            
            ;;
        3)
            echo "PiKickOS, Retropie, OlED & LED"
            Poser
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_Addons
            #Pimiga_Amiberry
            Configure_Amiga
            Pimiga_Retropie
          
            
            ;;
         
           
          

esac


clear
toilet -F gay PiKickOS

echo " "
      echo " "
      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
      sudo rm -rf ~/.local/share/Trash
      #sudo rm -rf ~/PiKickOS   Debug!
      sudo rm -rf ~/amigafonts/
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga

     whiptail --msgbox " Ready,... Okey, here we are ... Lets PiKickOS (mini) :-)" 20 60 1
clear
toilet -F gay PiKickOS













