#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020
## PWR-LED (green) 
#dtoverlay = pwr-led, gpio = 17
# HDD LED (orange)
#dtoverlay = act-led, gpio = 27

#******************************************** #History ************* ********************************************
#****************************************************************************************************************

# 11.01.2021 Amibian update & Settings Ok 
# 11.01.2021 PiKiss OK -> todo CoolTerm, Certificates 
# 18.01 Menu & Funktions
# 25.01 Amiga XFCE4 Desktop, OLED, bugfix
# 26.01 added Convert Raspberry Pi OS to Pimiga3000
# 26.01 added Convert Raspberry Pi OS 64 bit to Pimiga3000 64bit

#***********************************************  #Preinstall stuff *********************************************
#****************************************************************************************************************

if [ "$(whoami &2>/dev/null)" == "root" ] && [ "$(id -un &2>/dev/null)" == "root" ]
      then
      echo "Don't be root to run this script!"
      echo "Pleas don't use 'sudo !!'"
      exit 1
fi
  
sudo apt-mark hold lxpanel
sudo apt-get -y update 
sudo apt install -y toilet
sudo apt install -y dialog
sudo apt install -y mc git 

clear  
toilet -F gay Pimiga3000


whiptail --msgbox " Please start in CLI Mode! Go to "raspi-config" System Options/ Boot Auto Login/ B2 Console Autologin! !" 20 60 1

#sudo raspi-config

clear
toilet -F gay Pimiga3000
cd ~
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

#git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
cd /home/$USER/Pimiga_mini/OLED
sudo chmod -R 777 /home/$USER/Pimiga_mini/OLED
# Test OLED
#i2cdetect -y 1
#echo " Should Say: "3C""
python Amiga.py

cd /home/$USER/Pimiga_mini/LED
python LED.py

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
echo "Backup Settings...."
echo " "
echo " "

cd /home/$USER/Pimiga_mini/
unzip ~/Pimiga_mini/data.pac
#mkdir /home/$USER/.backup/
#sudo chmod -R 777 ~/.backup/
#cp -R ~/.config/ ~/.backup/.config
#cp -R ~/.local/ ~/.backup/.local
#cp -R /usr/local/bin ~/.backup/usr

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

clear

#*********************************************  #Installing Amibian Desktktop*********************************
#****************************************************************************************************************
Pimiga_Desktop() {
      clear
      toilet -F gay Pimiga3000 
   
   echo "Installing Pimiga3000 Desktop ..."
   echo " "
   echo " "
  
    
      # Fresh install XFCE4
      sudo apt purge -y xorg xserver-xorg lxde raspberrypi-ui-mods lxde-common lxde-core
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
      #sudo apt install -y thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk
      
      rm -r ~/.config
      mkdir ~/.config
      rm -r ~/.local
      mkdir ~/.local
      mv ~/Pimiga_mini/.data/.config/ /home/$USER/
      mv ~/Pimiga_mini/.data/.local/ /home/$USER/
  
      
      # Fresh install Amiga Desktop
      cd /usr/share/icons/
      sudo cp -R /home/$USER/Pimiga_mini/Amiga_Logos /usr/share/icons
      sudo cp -R /home/$USER/Pimiga_mini/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -r /usr/share/icons/default
      sudo mv /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      
      cd /home/$USER/Pimiga_mini/Amiga_Logos
      git clone --depth=1 https://github.com/x64k/amitk
      sudo cp -R /home/$USER/Pimiga_mini/Amiga_Logos/amitk /usr/share/themes
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      sudo mv /home/$USER/Pimiga_mini/Amiga_Logos/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -r /usr/share/themes/Default/xfwm4/
      sudo cp -R /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      
           
      #I am combining the theme with the Amiga3.x gtk2 theme from untouchable89:
      #http://xfce-look.org/content/show.php/Amiga3.x?content=127251

      #These mousepointers from xBreeze are great with the theme, too:
      #http://xfce-look.org/content/show.php/Amiga+Classic+Red?content=128152

      #Use it with the one and only Topaz font here:
      #https://github.com/rewtnull/amigafonts
      
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
#*******************************************  #Lets install some usefull Tools:)*********************************
#****************************************************************************************************************

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
      sudo apt-get install -y libfreetype6-dev libgl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libudev-dev libasound2-dev liblzma-dev libjpeg-dev libtiff-dev libwebp-dev git build-essential
      sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      
      sudo apt install -y  geany geany-plugins-common geany-common imagemagick gparted synaptic chromium-browser krita-l10n synaptic mc zip
      
      
      
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
#***************************************** # Install Amiberry 32bit *********************************************
#****************************************************************************************************************
     
     Pimiga_Amiberry() {
      # Install Amiberry Raspberry Pi with SDL2 + DispmanX
      
      clear
      toilet -F gay Pimiga3000
      
      echo " "
      echo " "
      echo "  ... here comes Amiberry  :-)   " 
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
      echo "  ... lets configer ClassicWB" 
      echo " "
      echo " " 
     
      
      cd /home/$USER
      cp -R /home/$USER/Pimiga_mini/Amiga/Amiga.zip /home/$USER
      unzip ./Amiga.zip
      rm -r ./Amiga.zip
      
      mkdir /home/$USER/Amiga
      mkdir /home/$USER/Amiga/HDD
      mkdir /home/$USER/Amiga/FDD
      mkdir /home/$USER/Amiga/FDD/Workbench
      
      
      sudo chmod -R 777 /home/$USER/Amiga
      
      cd ~/Amiga
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo "  ... downloading  ClassicWB"  
      echo " "
      echo " "
      cd /home/$USER/Amiga/HDD
      
      if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip ./ClassicWB_UAE_v28.zip
      
      fi
      
      if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_P96_v28.zip ]; then
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_P96_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_P96_v28.zip
      unzip ./ClassicWB_P96_v28.zip
      
      fi
      
      if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_OS39_v28.zip ]; then
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_OS39_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip ./ClassicWB_OS39_v28.zip
      
      fi
      
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
      
      fi
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo " Downloading  AROS... " 
      echo " "
      echo " "
      
      cd /home/$USER/Amiga/HDD
      
      if [ ! -f /home/$USER/Amiga/HDD/AROS/aros-rom.bin ]; then
      wget https://vps691225.ovh.net/download/builds/AROS/amiga-m68k-20201206-135516.tar.gz --no-check-certificate
      echo " "
      echo " "
    
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure  AROS... " 
      echo " "
      echo " " 
      gunzip ./amiga-m68k-20201206-135516.tar.gz
      tar -xvf ./amiga-m68k-20201206-135516.tar
      mv /home//$USER/Amiga/HDD/amiga-m68k-20201206-135516 /home/$USER/Amiga/HDD/AROS
      
      fi
        
      
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
      echo "Use only if you have the original!  "
      echo " (Original Amiga, Amiga Forever,..."
      echo " Be fair and honest!"
      sleep 4s
      wget https://misapuntesde.com/res/Amiga_roms.zip
      mv ./Amiga_roms.zip /home/$USER/Amiga/kickstarts/
      cd ~/Amiga/kickstarts/
      unzip ./Amiga_roms.zip
     
    
      fi
      
      cd /home/$USER/Amiga/FDD
      cp -R /home/$USER/Pimiga_mini/Amiga/Amiga.zip /home/$USER/Amiga/FDD
      unzip ./Amiga.zip
      sudo rm -r ./Amiga.zip
      
      toilet -F gay Pimiga3000
      echo " "
      echo " "
    

      sudo chmod -R 777 /home/$USER/Amiga
    
      
    }
#****************************************  Install Amiberry 64bit Raspberry *************************************
#****************************************************************************************************************    
   Pimiga_Amiberry64() {
     
      
      clear
      toilet -F gay Pimiga3000
      
      echo " "
      echo " "
      echo "  ... here comes Amiberry 64 bit :-)   " 
      echo " "
      echo " "  
      cd ~
      
      mkdir /home/$USER/Amiga
      mkdir /home/$USER/Amiga/HDD
      mkdir /home/$USER/Amiga/FDD
      mkdir /home/$USER/Amiga/FDD/Workbench
      
       # Install Amiberry 64
      
      cd /home/$USER/
      
      git clone https://github.com/midwan/amiberry
      cd //home/$USER/amiberry
      make -j2 PLATFORM=pi64
      
      sudo chmod -R 777 /home/$USER/amiberry
      cp -R /home/$USER/amiberry/* /home/$USER/Amiga
      
      #echo "  Amiberry64 is compiled ...     " 
      echo " "
      echo " "
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo "  ... lets configer ClassicWB" 
      echo " "
      echo " " 
      # Install Amiberry 64
      
      #cd /home/$USER
      #cp -R /home/$USER/amiberry/* /home/$USER/Amiga
      #cp -R /home/$USER/Pimiga_mini/Amiga/amiberry-v3.3-rpi4-64bit.zip /home/$USER/Amiga
      #unzip ./Amiga.zip
      #rm -r ./Amiga.zip
      
            
      cd /home/$USER
      cp -R /home/$USER/Pimiga_mini/Amiga/Amiga.zip /home/$USER
      unzip ./Amiga.zip
      sudo rm -r ./Amiga.zip
      
      sudo chmod -R 777 /home/$USER/Amiga
      
      cd ~/Amiga
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo "  ... downloading  ClassicWB"  
      echo " "
      echo " "
      cd /home/$USER/Amiga/HDD
      
      if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip ./ClassicWB_UAE_v28.zip
      
      fi
      
      if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_P96_v28.zip ]; then
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_P96_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_P96_v28.zip
      unzip ./ClassicWB_P96_v28.zip
      
      fi
      
      if [ ! -f /home/$USER/Amiga/HDD/ClassicWB_OS39_v28.zip ]; then
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB_OS39_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip ./ClassicWB_OS39_v28.zip
      
      fi
      
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
      
      fi
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo " Downloading  AROS... " 
      echo " "
      echo " "
      
      cd /home/$USER/Amiga/HDD
      
      if [ ! -f /home/$USER/Amiga/HDD/amiga-m68k-20201206-135516.tar.gz ]; then
      wget https://vps691225.ovh.net/download/builds/AROS/amiga-m68k-20201206-135516.tar.gz --no-check-certificate
      echo " "
      echo " "
    
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure  AROS... " 
      echo " "
      echo " " 
      gunzip ./amiga-m68k-20201206-135516.tar.gz
      tar -xvf ./amiga-m68k-20201206-135516.tar
      mv /home//$USER/Amiga/HDD/amiga-m68k-20201206-135516 /home/$USER/Amiga/HDD/AROS
      
      fi
        
      
      cd ~/Amiga
      
   
      echo " "
      echo " "
      if [ ! -f /home/$USER/Amiga/Amiga_roms.zip ]; then
      clear
      toilet -F gay ** NOTE! **
      toilet -F gay ****************************
      echo " "
      echo " "
      echo "The roms and workbench files are under copyrigt! "
      echo "Use only if you have the original!  "
      echo " "
      echo " (Original Amiga, Amiga Forever,..."
      echo " Be fair and honest!"
      sleep 6s
      
      wget https://misapuntesde.com/res/Amiga_roms.zip
      mv ./Amiga_roms.zip /home/$USER/Amiga/kickstarts/
      cd ~/Amiga/kickstarts/
      unzip ./Amiga_roms.zip
     
    
      fi
      
      cd /home/$USER/Amiga/FDD
      cp -R /home/$USER/Pimiga_mini/Amiga/Amiga.zip /home/$USER/Amiga/FDD
      unzip ./Amiga.zip
      sudo rm -r ./Amiga.zip
      
      toilet -F gay Pimiga3000
      echo " "
      echo " "
    

      sudo chmod -R 777 /home/$USER/Amiga
    
      
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


#****************************************   #finish all   *******************************************************
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
            
            ;;
        2)
            echo "Convert Amibian to Pimiga3000"
            Amibian_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Pimiga_Amiberry
            ;;
        3)
            echo "Convert Raspberry Pi OS to Pimiga3000"
           
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Pimiga_Amiberry
            #Pimiga_Retropie
          
            
            ;;
         4)
            echo "Convert Raspberry Pi OS 64 to Pimiga3000 64"
           
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Pimiga_Amiberry64
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
startx
