#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020
## PWR-LED (green) 
#dtoverlay = pwr-led, gpio = 17
# HDD LED (orange)
#dtoverlay = act-led, gpio = 27
#https://archive.org/compress/Amiga_WHD_Games

# Todo: Em neut, AFor strukt, Rena pro  . Boot Co ...Spe,  Cat Boo, AWallWal, Ami Tur

#******************************************** #History ************* ****************************************
#************************************************************************************************************

# 11.01.2021 Amibian update & Settings Ok 
# 11.01.2021 PiKiss OK -> todo CoolTerm, Certificates 
# 18.01 Menu & Funktions
# 25.01 Amiga XFCE4 Desktop, OLED, bugfix
# 26.01 added Convert Raspberry Pi OS to Pimiga3000
# 26.01 added Convert Raspberry Pi OS 64 bit to Pimiga3000 64bit
# funktions and structure Test 32/64bit OK

#***********************************************  #Preinstall stuff *****************************************
#*************************************************************************************************************
Amiberry32=amiberry-v3.3-rpi4-dmx-32bit.zip
Amiberry64=amiberry-v3.3-rpi4-64bit.zip


#***********************************************  #Are you sudo? *********************************************
if [ "$(whoami &2>/dev/null)" == "root" ] && [ "$(id -un &2>/dev/null)" == "root" ]
      then
      echo "Don't be root to run this script!"
      echo "Please don't use 'sudo !!'"
      sleep 15s
      exit 1
fi
#***********************************************  #Are you runing Desktop?  ***********************************
if  xset q &>/dev/null; then
    echo "No X server at \$DISPLAY [$DISPLAY]" >&2
    sleep 15s
    exit 1
fi 
#***********************************************  #Ok, we are ready...  ***************************************

sudo apt-mark hold lxpanel
sudo apt-get -y update 
sudo apt install -y toilet
sudo apt install -y dialog
sudo apt install -y mc git 

clear  
toilet -F gay Pimiga3000
cd /home/$USER/Pimiga_mini/

if [ ! -f /home/$USER/Pimiga_mini/.data ]; then
      unzip ~/Pimiga_mini/data.pac
fi
# whiptail --msgbox " Please start in CLI Mode! Go to "raspi-config" System Options/ Boot Auto Login/ B2 Console Autologin! !" 20 60 1

#sudo raspi-config

clear
toilet -F gay Pimiga3000
cd ~


clear
toilet -F gay Pimiga3000

echo " "
echo " "
echo " "
echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start ..."
echo " "


#******************************************** #Pimiga3000 mini  Menu ********************************************
#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="Pimiga3000"
TITLE="Pimiga3000 mini"
MENU="Please select:"

OPTIONS=(1 "Install Pimiga3000 on Amibian - not working"
         2 "Convert Amibian to Pimiga3000 - not working"
         3 "Convert Raspberry Pi OS to Pimiga3000 "
         4 "Convert Raspberry Pi OS 64bit to Pimiga3000 64bit ")

CHOICE=$(dialog --clear \
                --backtitle "$Pimiga3000" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                
                
                
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
#cd /home/$USER/Pimiga_mini/OLED
#sudo chmod -R 777 /home/$USER/Pimiga_mini/OLED


# Test OLED
#i2cdetect -y 1
#echo " Should Say: "3C""
#python Amiga.py

cd /home/$USER/Pimiga_mini/LED
#python LED.py


}
#*********************************************  #Time to update:)  **********************************************
#****************************************************************************************************************

Pimiga_Update() {

      clear
      toilet -F gay Pimiga3000

      echo " "
      echo " "
      echo "            Time to update:)              "
      echo " "
      echo " "
      echo "Installing Pimiga3000 Update System ..."
      echo " "
      echo " "
      sudo apt-get -y upgrade

}



#*********************************************  #Installing Pimiga_Tools*********************************
#**********************************************************************************************************

Pimiga_Tools() {

      clear
      toilet -F gay Pimiga3000

      echo " "
      echo " "
      echo "            Lets install some usefull Tools:)              "
      echo " "
      echo " "

      
      
      sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
      sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev
      # Test
      #sudo apt-get install -y libfreetype6-dev libgl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libjpeg-dev libtiff-dev libwebp-dev git build-essential
      #sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      sudo apt install -y  geany geany-plugins-common geany-common imagemagick gparted firefox-esr  krita-l10n synaptic 
      
      
      
      clear
      toilet -F gay Pimiga3000
      
      #Some little Amiga stuff....
      sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -R /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
      sudo cp -R /home/$USER/Pimiga_mini/scripts/* /usr/local/bin
      
}



#*********************************************  #Installing Pimiga Desktop*********************************
#**********************************************************************************************************
 
 Pimiga_Desktop() {
 
      clear
      toilet -F gay Pimiga3000 
   
      echo "Installing Pimiga3000 Desktop ..."
      echo " "
      echo " "
      
      # Fresh install XFCE4
      sudo apt purge -y lxde raspberrypi-ui-mods lxde-common lxde-core
      #Test! sudo apt purge -y xorg xserver-xorg lxde raspberrypi-ui-mods lxde-common lxde-core
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
      #sudo apt install -y thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk
      
      rm -r ~/.config
      mkdir ~/.config
      rm -r ~/.local
      mkdir ~/.local
      mv ~/Pimiga_mini/.data/.config/ /home/$USER/
      mv ~/Pimiga_mini/.data/.local/ /home/$USER/
  
      
      # Fresh install Amiga Desktop
    
if [ ! -f /usr/share/icons/AMIGAOSLINUX.zip ]; then

      cd /usr/share/icons/
      sudo cp -R /home/$USER/Pimiga_mini/Amiga_Logos /usr/share/icons
      sudo cp -R /home/$USER/Pimiga_mini/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -r /usr/share/icons/default
      sudo mv /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
fi     

if [ ! -f /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/Pimiga_mini/Amiga_Logos
      git clone --depth=1 https://github.com/x64k/amitk
      sudo cp -R /home/$USER/Pimiga_mini/Amiga_Logos/amitk /usr/share/themes
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      sudo mv /home/$USER/Pimiga_mini/Amiga_Logos/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -r /usr/share/themes/Default/xfwm4/
      sudo cp -R /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      
fi
      
}



#***************************************** # Install Amiberry 32bit *********************************************
#****************************************************************************************************************
     
     
 Pimiga_Amiberry32() {
      
      # Install Amiberry Raspberry Pi with SDL2 + DispmanX
      
      clear
      toilet -F gay Pimiga3000
      
      echo " "
      echo " "
      echo "  ... here comes Amiberry 32bit  :-)   " 
      echo " "
      echo " "  
      cd ~
      
      sudo apt-get install -y libfreetype6-dev libgl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libjpeg-dev libtiff-dev libwebp-dev git build-essential
      #sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
      #sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      #git clone https://github.com/midwan/amiberry
      #cd amiberry
      #make -j2 PLATFORM=rpi4
      #sudo chmod -R 777 /home/$USER/amiberry
   
      
      #echo "  Amiberry is compiled ...     " 
      echo " "
      echo " "
      clear
      toilet -F gay Pimiga3000
      echo " "
      
      cp -R /home/$USER/Pimiga_mini/Amiga/$Amiberry32 /home/$USER
      unzip ./$Amiberry32 
      rm -r ./$Amiberry32 
   
   
    
}


      #****************************************  Install Amiberry 64bit Raspberry *************************************
      #****************************************************************************************************************  
      
      
Pimiga_Amiberry64() {
     
      
      clear
      toilet -F gay Pimiga3000 64bit
      
      echo " "
      echo " "
      echo "  ... here comes Amiberry 64 bit :-)   " 
      echo " "
      echo " "  
      cd ~
      
        
      # Test (Speed)  * First trz SDL Error / should be bossible. Corrupt Imge bz tests_ 
      #cp -R /home/$USER/Pimiga_mini/Amiga/$Amiberry64 /home/$USER
      #unzip ./$Amiberry64
      #cp -R /home/$USER/Pimiga_mini/Amiga/amiberry-v3.3-rpi4-64bit/* /home/$USER/Amiga
      #rm -r ./$Amiberry64
      
            
       #Compile Amiberry 64
       
       cd 
       git clone https://github.com/midwan/amiberry
       cd ~/amiberry
       make -j2 PLATFORM=pi64
       clear
       toilet -F gay Pimiga3000 64bit
       cp -R /home/$USER/amiberry/* /home/$USER/Amiga
       sudo chmod +x /home/$USER/Amiga/amiberry
}    
           

#***************************************** # Configure Amiga *********************************************
#****************************************************************************************************************
     
     
      Configure_Amiga() {
       
             
      cd ~/Amiga
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo "  ... lets configer ClassicWB" 
      echo " "
      echo " " 
      echo "  ... downloading  ClassicWB"  
      echo " "
      echo " "
      
      cd ~
      cp -R /home/$USER/Pimiga_mini/Amiga/Amiga.zip /home/$USER
      unzip ./Amiga.zip
      rm -r ./Amiga.zip
      
      cd /home/$USER/Amiga/HDD
      
      #if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_UAE_v28.zip ]; then
      #clear
      #toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...     " 
      echo " "
      echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      #unzip ./ClassicWB_UAE_v28.zip
      
      #fi
      
      #if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_P96_v28.zip ]; then
      #clear
      #toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_P96_v28 ...     " 
      echo " "
      echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_P96_v28.zip
      #unzip ./ClassicWB_P96_v28.zip
      
      #fi
      
      #if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_OS39_v28.zip ]; then
      #clear
      #toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_OS39_v28 ...     " 
      echo " "
      echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      #unzip ./ClassicWB_OS39_v28.zip
      
      #fi
      
      if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_68K_v28.zip ]; then
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip ./ClassicWB_68K_v28.zip
      
      #fi
    
      
      cd /home/$USER/Amiga/HDD
      
      cd ~/Amiga
      clear
      toilet -F gay Pimiga3000
   
      echo " "
      echo " "
      if [ ! -f /home/$USER/Amiga/Amiga_roms.zip ]; then
      clear
      toilet -F gay NOTE!
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
     
    
      fi
      
     
      
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      
      
      mv /home/$USER/Pimiga_mini/Amiga/conf/* /home/$USER/Amiga/conf  

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

Pimiga_PiKiss() {
     #Install PiKISS
      
      clear
      toilet -F gay Pimiga3000
      
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
      toilet -F gay Pimiga3000
      echo " "
      echo " "
     
      #sudo ./piKiss.sh 
      
}

     
#**********************************************  #Install Retropie/Setup  ***************************************
#****************************************************************************************************************
  
  
Pimiga_Retropie() {
#Install Retropie/Setup
      
      clear
      toilet -F gay Pimiga3000
      
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
      toilet -F gay Pimiga3000
      sudo __nodialog=1 ./retropie_packages.sh setup amiberry
      clear
      toilet -F gay Pimiga3000
      sudo __nodialog=1 ./retropie_packages.sh setup vice
      sudo _clear
      toilet -F gay Pimiga3000
      sudo _nodialog=1 ./retropie_packages.sh setup lr-vice
      clear
      toilet -F gay Pimiga3000
      #sudo __nodialog=1 ./retropie_packages.sh setup giana
      clear
      toilet -F gay Pimiga3000
      #sudo __nodialog=1 ./retropie_packages.sh setup eduke32
      
      
      
      
      
}

#**********************************************  #Finish setup  ***************************************
#****************************************************************************************************************

cd ~

clear
toilet -F gay Pimiga3000

case $CHOICE in
        1)
            echo "Install Pimiga3000 on Amibian"
           
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Amibian
            Configure_Amiga
            ;;
        2)
            echo "Convert Amibian to Pimiga3000"
            #Poser
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Amibian            
            Pimiga_Amiberry32
            Configure_Amiga
            
            ;;
        3)
            echo "Convert Raspberry Pi OS to Pimiga3000"
            #Poser
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Pimiga_Amiberry
            Pimiga_Amiberry32
            Configure_Amiga
            #Pimiga_Retropie
          
            
            ;;
         4)
            echo "Convert Raspberry Pi OS 64 to Pimiga3000 64"
            #Poser
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Pimiga_Amiberry64
            Configure_Amiga
            #Pimiga_Retropie does not work :-(
          
           ;;

esac


clear
toilet -F gay Pimiga3000

echo " "
      echo " "
      echo "  ... cleanup and finish setup  "  
      
      sudo rm -r /home/pi/.local/share/Trash/
      sudo rm -r /home/pi/amigafonts/
      
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga

    #  whiptail --msgbox " Ready,... Okey, here we are ... Lets Pimiga3000 (mini) :-)" 20 60 1
clear
toilet -F gay Pimiga3000
pimiga.sh












