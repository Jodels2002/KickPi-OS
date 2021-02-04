#!/bin/bash
# Install KickPi-OS
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
# 26.01 added Convert Raspberry Pi OS to KickPi-OS (32bit)
# 26.01 added Convert Raspberry Pi OS 64 bit to KickPi-OS - 64bit
# funktions and structure Test 32/64bit OK

#***********************************************  #Preinstall stuff *****************************************
#*************************************************************************************************************
sudo apt-mark hold lxpanel
#sudo apt-get -y update 
sudo apt install -y toilet dialog mc git 
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin
cp -R  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
clear
if [ "$(getconf LONG_BIT)" == "64" ]; then
 
     echo "Raspberry Pi OS 64 bit is running..."
       
    else  echo " "
      echo ""
fi    
toilet -F gay KickPi-OS
      echo " "
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
      
      echo " " 
      echo "	LOADWB ...  :-)"

   sleep 8s
    
sudo rm -rf /home/$USER/.local/share/Trash/*
  
  

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

#******************************************** #KickPi-OS mini  Menu ********************************************
#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="KickPi-OS"
TITLE="Main Menu"
MENU="Please select:"

OPTIONS=(1 "Install KickPi-OS light"
         2 "Install KickPi-OS full, Retropie, ...")
        

CHOICE=$(dialog --clear \
                --backtitle "$KickPi-OS" \
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
      toilet -F gay KickPi-OS

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
      toilet -F gay KickPi-OS

      echo " "
      echo " "
      echo "            Lets install some usefull Tools:)              "
      echo " "
      echo " "

          
      sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
      sudo apt-get install -y gir1.2-ibus-1.0 libdbus-1-dev libegl1-mesa-dev libibus-1.0-5 libibus-1.0-dev libice-dev libsm-dev libsndio-dev libwayland-bin libwayland-dev libxi-dev libxinerama-dev libxkbcommon-dev libxrandr-dev libxss-dev libxt-dev libxv-dev x11proto-randr-dev x11proto-scrnsaver-dev x11proto-video-dev x11proto-xinerama-dev
      sudo apt install -y  geany geany-plugins-common geany-common zip gparted unzip xmlstarlet
      sudo apt install -y imagemagick firefox-esr  krita-l10n
      
      
      clear
      toilet -F gay KickPi-OS
      
      #Some little Amiga stuff....
      sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms
      clear
      toilet -F gay KickPi-OS
      echo " "
      echo " "
      cd /home/$USER
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -R /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
  
      
}



#*********************************************  #Installing KickPi-OS Desktop*********************************
#**********************************************************************************************************
 
 KickPi-OS_Desktop() {
 
      clear
      toilet -F gay KickPi-OS 
   

     
     # Fresh install XFCE4
      sudo apt purge -y lxde raspberrypi-ui-mods lxde-common lxde-core
      sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput
      #sudo apt install -y thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk
      
      sudo chmod -R 777 /home/$USER/KickPi-OS
      sudo chmod -R 777 /home/$USER/.config
      sudo chmod -R 777 ~/.local
      sudo cp -R ~/KickPi-OS ~/.KickPi-OS
      cd /home/$USER/KickPi-OS/
      cp -R ~/KickPi-OS/config/Desktop/* /home/$USER/Desktop/

      sudo unzip ~/KickPi-OS/.pac/.data.pac

      
      cp -R ~/KickPi-OS/data/.config/ /home/$USER/
      cp -R ~/KickPi-OS/data/.local/ /home/$USER/
      sudo chmod -R 777 /home/$USER/KickPi-OSKickPi-OS
      sudo chmod -R 777 /home/$USER/.local
      sudo chmod -R 777 /home/$USER/.config
      
      # Fresh install Amiga Desktop
    
if [ ! -f /usr/share/icons/AMIGAOSLINUX.zip ]; then

      cd /usr/share/icons/
      sudo cp -R /home/$USER/KickPi-OS/Amiga_Logos /usr/share/icons
      sudo cp -R /home/$USER/KickPi-OS/data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      sudo rm -rf /usr/share/icons/default
      sudo mv /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      else 
      clear
fi     

if [ ! -f /usr/share/themes/Amiga3.x_hidpi/ ]; then
      cd /home/$USER/KickPi-OS
      git clone --depth=1 https://github.com/x64k/amitk
      sudo cp -R /home/$USER/KickPi-OS/amitk /usr/share/themes
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      sudo mv /home/$USER/KickPi-OS/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -R /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -R /home/$USER/KickPi-OS/config/rpd-wallpaper/* /usr/share/backgrounds/
      else 
      clear
      
fi
       cp -R ~/KickPi-OS/data/.config/ /home/$USER/
       cp -R ~/KickPi-OS/data/.local/ /home/$USER/    
}



#***************************************** # Install Amiberry  *********************************************
#****************************************************************************************************************
     
     
 KickPi-OS_Amiberry() {
 
 clear
      toilet -F gay KickPi-OS
      
      echo " "
      echo " "
   
      echo " "
      echo " "  
      cd ~
      mkdir /home/$USER/Amiga
 
 if [ "$(getconf LONG_BIT)" == "64" ]; then
 
       echo " "
       echo " "
       echo "  ... here comes Amiberry 64 bit :-) "
       
       
       clear
       toilet -F gay KickPi-OS 
       toilet -F gay 64bit
       echo " "
       echo " "
      cd /home/$USER/KickPi-OS/Amiga
      unzip /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-64bit.zip 
      cp -r /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-64bit/* /home/$USER/Amiga
      cp -R /home/$USER/KickPi-OS/Amiga/amiberry /home/$USER/Amiga
      sudo chmod +x /home/$USER/amiberry/amiberry
       
       
       
    else
    
       echo " ... here comes Amiberry 32 bit   :-)"
       
      cd /home/$USER/KickPi-OS/Amiga
      unzip /home/$USER/KickPi-OS/Amiga/amiberry-v3.3-rpi4-dmx-32bit.zip 
      cp -r /home/$USER/KickPi-OS/Amiga/amiberry-rpi4-dmx-32bit/* /home/$USER/Amiga
    fi
    
    cd /home/$USER/KickPi-OS/Amiga
    unzip /home/$USER/KickPi-OS/Amiga/AROS.zip
    cp -r /home/$USER/KickPi-OS/Amiga/AROS/* /home/$USER/Amiga/Harddisk/
}


     

#***************************************** # Configure Amiga *********************************************
#****************************************************************************************************************
     
     
      Configure_Amiga() {
       
             
      cd ~/Amiga
      clear
      toilet -F gay KickPi-OS
      echo " "
      echo "  ... lets configer ClassicWB" 
      echo " "
      echo " " 
      echo "  ... downloading  ClassicWB"  
      echo " "
      echo " "
      
      cd ~
      cp -R /home/$USER/KickPi-OS/Amiga/Amiga.zip /home/$USER
      unzip ./Amiga.zip
      rm -rf ./Amiga.zip
      
      cd /home/$USER/Amiga/hdf
      
      #if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      #clear
      #toilet -F gay KickPi-OS
      #echo " "
      #echo " "
      #echo "  Configure ClassicWB_UAE_v28 ...     " 
      #echo " "
      #echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      #unzip ./ClassicWB_UAE_v28.zip
      #else 
      #clear
      #toilet -F gay KickPi-OS
      #fi
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_P96_v28.zip ]; then
      clear
      toilet -F gay KickPi-OS
      echo " "
      echo " "
      echo "  Configure ClassicWB_P96_v28 ...     " 
      echo " "
      echo " "
    
      wget http://download.abime.net/classicwb/ClassicWB_P96_v28.zip
      unzip ./ClassicWB_P96_v28.zip
      else 
      clear
      toilet -F gay KickPi-OS
      fi
      
      #if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip ]; then
      #clear
      #toilet -F gay KickPi-OS
      #echo " "
      #echo " "
      #echo "  Configure ClassicWB_OS39_v28 ...     " 
      #echo " "
      #echo " "
      #wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      #unzip ./ClassicWB_OS39_v28.zip
      #else 
      #clear
      #toilet -F gay KickPi-OS
      #fi
      
      cd /home/$USER/Amiga/hdf
      if [ ! -f "/home/$USER/Amiga/HDF/ClassicWB_68K_v28.zip" ]; then
      clear
      toilet -F gay KickPi-OS
     
      else 
      clear
      toilet -F gay KickPi-OS
      echo " "
      echo " "
      echo "  Configure ClassicWB_68K_v28 ...     " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_68K_v28.zip
      unzip ./ClassicWB_68K_v28.zip
      
      fi

    
      
      cd /home/$USER/Amiga/hdf
      
      cd ~/Amiga
      clear
      toilet -F gay KickPi-OS
   
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
      toilet -F gay KickPi-OS
      else 
      clear
      toilet -F gay NOTE!

    
      fi

      
      toilet -F gay KickPi-OS
      echo " "
      echo " "
      
      
      mv /home/$USER/KickPi-OS/Amiga/conf/* /home/$USER/Amiga/conf  

      sudo chmod -R 777 /home/$USER/Amiga
    }    
   

       
#*********************************************  # Amibian  **********************************************
#********************************************# Not testet! *******************************************************

 Amibian() {
      
     
      if [ $USER == "amibian" ]; then
 
               clear
          
               echo "Amibian... not full implementet now....!"
               echo "Backup Settings...."
               echo " "
               echo " "
 
               mkdir /home/$USER/.backup/
               sudo chmod -R 777 ~/.backup/
               cp -R ~/.config/ ~/.backup/.config
               cp -R ~/.local/ ~/.backup/.local
               cp -R /usr/local/bin ~/.backup/usr
               
               echo" Debug wait... Not finished here..! :-) "
                 sleep 15
       #cp -R ~/KickPi-OS/data/.config/ /home/$USER/
       #cp -R ~/KickPi-OS/data/.local/ /home/$USER/
       
    else 
      clear
      echo "Raspian OS, nothing to do here..."
 
fi    
     
   
     
}

    
#****************************************   #Install PiKISS  ****************************************************
#****************************************************************************************************************

KickPi-OS_Addons() {
     
     #Install PiKISS
      git clone --depth=1 https://github.com/jmcerrejon/PiKISS
      cd PiKISS
      sudo chmod -R 777 ./piKiss.sh
      
      #PiCommander
      cd
       sudo apt install -y python-pil python3-pil python-pil-doc 
      git clone --depth=1 https://github.com/Jack477/CommanderPi
      cd CommanderPi
      ./install.sh
      
      # Cool-Retro-Term
      #sudo apt install -y build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-localstorage qml-module-qtquick-window2 qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel
}

     
#**********************************************  #Install Retropie/Setup  ***************************************
#****************************************************************************************************************
  
  
KickPi-OS_Retropie() {
#Install Retropie/Setup
      
    
    
      
    if [ "$(getconf LONG_BIT)" == "64" ]; then
   
      clear
       toilet -F gay KickPi-OS 
       toilet -F gay 64bit
      echo " "
      echo " "
      echo "Sorry, Retropie dosn´t support 64 bit OS... (-:     "   
      
      sleep 3s
      
      
    else
     
    echo " "
      clear
      toilet -F gay KickPi-OS 
      echo " "
      echo "  ... here comes Retropie :-)     "   
      echo " "
      echo " "
      cd
      git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
      sudo chmod -R 777 /home/$USER/RetroPie-Setup/
      cd  
      cd RetroPie-Setup 
      sudo __nodialog=1 ./retropie_packages.sh setup binaries_setup
      sudo __nodialog=1 ./retropie_packages.sh setup basic_install
      clear
      toilet -F gay KickPi-OS
      sudo __nodialog=1 ./retropie_packages.sh setup amiberry
      clear
      toilet -F gay KickPi-OS
      sudo __nodialog=1 ./retropie_packages.sh setup vice
      sudo _clear
      toilet -F gay KickPi-OS
      
      cd /home/pi/KickPi-OS/Retropie/
      unzip /home/$USER/KickPi-OS/Retropie/roms.zip
      cp -R /home/$USER/KickPi-OS/Retropie/roms/* /home/$USER/RetroPie/roms
      
      
      unzip /home/$USER/KickPi-OS/Retropie/all.zip
      sudo cp -R /home/$USER/KickPi-OS/Retropie/all/* /opt/retropie/configs/

    
 fi      


     
}


#**********************************************  #Finish setup  ***************************************
#****************************************************************************************************************

cd ~

clear
toilet -F gay KickPi-OS

case $CHOICE in
        
        1)
        
            #Poser
            KickPi-OS_Desktop
            Amibian
            KickPi-OS_Update
            KickPi-OS_Tools
            #KickPi-OS_Addons
            KickPi-OS_Amiberry
            Configure_Amiga
            #KickPi-OS_Retropie
            ;;
        
        2)
             
            echo "KickPi-OS, Retropie"
            #Poser
            Amibian
            KickPi-OS_Desktop
            KickPi-OS_Update
            KickPi-OS_Tools
            KickPi-OS_Addons
            KickPi-OS_Amiberry
            Configure_Amiga
            KickPi-OS_Retropie
            ;;
        
        #3)
            #echo "KickPi-OS, Retropie, OlED & LED"
            #Poser
            #KickPi-OS_Desktop
            #KickPi-OS_Update
            #KickPi-OS_Tools
            #KickPi-OS_Addons
            #KickPi-OS_Amiberry
            #Configure_Amiga
            #KickPi-OS_Retropie
               
            #;;
             

esac


clear
toilet -F gay KickPi-OS

echo " "
      echo " "
      echo "  ... cleanup and finish setup  "  
      sudo rm -rf /home/$USER/.bashrc
      cp  /home/$USER/.backup/.bashrc /home/$USER/.bashrc
      sudo rm -rf ~/.local/share/Trash
      #sudo rm -rf ~/KickPi-OS   Debug!
      sudo rm -rf ~/amigafonts/
      sudo apt-get -y autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/
      sudo chmod -R 777 /home/$USER/Amiga

whiptail --msgbox " Ready,... Okey, here we are ... Lets KickPi-OS (mini) :-)" 20 60 1
clear
toilet -F gay KickPi-OS

startx

