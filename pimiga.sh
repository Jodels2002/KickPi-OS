


#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020
## PWR-LED (green)
#dtoverlay = pwr-led, gpio = 17
# HDD LED (orange)
#dtoverlay = act-led, gpio = 27
# -language set for GB,DE,IT,ES..
# -OLED DISPLAY Amiga þ- bootpic... amyberry, amibian, Amiga Logo
# -since USBþStick possible... update BOOT and script create USBSTick (PI400) 
# -Cusom Webserver, RaspiControl, ( Lights, FAN, OLED;...) -> WebAdmin is overkill
# -Preinstalled ClassicWB for amyberry..... -> extract HDF to folder for easy acces from Linux
# -Amibian Colour Menue in Amiga colours - consultation with G.K -> OK
# -rename the Amibian Version of raspi-config ( Update proof) - consultation with G.K -> 
# Useful PiKiss Modules, CoolTerm, Certificates....stuff
# 11.01.2021 Amibian update & Settings Ok 
# 11.01.2021 PiKiss OK -> todo CoolTerm, Certificates 

if [ "$(whoami &2>/dev/null)" == "root" ] && [ "$(id -un &2>/dev/null)" == "root" ]
      then
      echo "Don't be root to run this script!"
      echo "Pleas don't use 'sudo !!'"
      exit 1
fi
sudo apt-get -y update 
sudo apt install -y toilet
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo " "

echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start a upgrade.... sit down and relaxe...!"
echo " "
echo "Backup Settings...."

mkdir /home/$USER/.backup/
sudo chmod -R 777 ~/.backup/

toilet -F gay Pimiga3000
cd ~/Pimiga_mini
clear
toilet -F gay Pimiga3000
#echo "Update Settings since LXDEPanel has a bug... to mutch applications on Dock ...No Image"
# Todo create a clean Menu
unzip ~/Pimiga_mini/data.pac
#rm -r ~/.config
#mkdir ~/.config
#rm -r ~/.local
#mkdir ~/.local
#mv ~/Pimiga_mini/.data/.config/ /home/$USER/
#mv ~/Pimiga_mini/.data/.local/ /home/$USER/
clear
toilet -F gay Pimiga3000
cd /usr/share/icons/
sudo cp -R /home/$USER/Pimiga_mini/.data/AMIGAOSLINUX.zip /usr/share/icons
sudo unzip /usr/share/icons/AMIGAOSLINUX.zip /usr/share/icons/
sudo cp -R /home/$USER/Pimiga_mini/data/ /usr/share/icons/

#mv ~/Pimiga_mini/.data/.config/lxsession ~/.config/lxsession
#mv ~/Pimiga_mini/.data/.config/lxterminal ~/.config/lxterminal
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "            Time to update:)              "

sudo apt-get -y upgrade

#xfce Desktop
#echo "XfCE4 install possible.....# if if whished:) "
sudo apt-get -y remove --auto-remove xserver-common*
sudo apt-get -y remove --auto-remove openbox*

clear
toilet -F gay Pimiga3000
sudo apt install -y xserver-xorg 
clear
toilet -F gay Pimiga3000
sudo apt install -y xserver-xorg xfce4 
sudo apt install -y xfce4-goodies
sudo apt install -y xfce4-utils
sudo apt install -y mc git gparted synaptic firefox-esr geany geany-plugins-common geany-common
clear
toilet -F gay Pimiga3000
sudo apt install -y gnome-core
clear
toilet -F gay Pimiga3000
#sudo apt install -y gdm
clear
toilet -F gay Pimiga3000
cp -R ~/.config/ ~/.backup/.config
cp -R ~/.local/ ~/.backup/.local
cp -R /usr/local/bin ~/.backup/usr
clear

apt install -y dialog
#sudo dpkg-reconfigure lightdm

#restore.....#  if needed:) "
#sudo cp -R  /home/amibian/.backup/ usr/local/bin
cd ~
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "  ... some litte tweaks       "    

    
#sudo apt-get -y install openbox-menu  obconf obconf-qt obmenu imagemagick
sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
clear
toilet -F gay Pimiga3000
sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
clear
toilet -F gay Pimiga3000
sudo apt-get install -y libraspberrypi-dev
clear
toilet -F gay Pimiga3000
#Some little Amiga stuff....
sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms

sudo chmod -R 777 /usr/local/bin/
sudo chmod -R 777 /usr/local/share/
cd ~
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "  ... here comes Retropie :-)     "   

#Install Retropie/Setup

#sudo apt-get install -y git dialog unzip xmlstarlet
#git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
#sudo chmod -R 777 /home/amibian/RetroPie-Setup/
#cd /home/amibian/RetroPie-Setup

#sudo __nodialog=1 ./retropie_packages.sh setup basic_install
clear
toilet -F gay Pimiga3000
#sudo __nodialog=1 ./retropie_packages.sh setup amiberry
clear
toilet -F gay Pimiga3000
#sudo __nodialog=1 ./retropie_packages.sh setup vice

#sudo _clear
toilet -F gay Pimiga3000_nodialog=1 ./retropie_packages.sh setup lr-vice
clear
toilet -F gay Pimiga3000
#sudo __nodialog=1 ./retropie_packages.sh setup giana
clear
toilet -F gay Pimiga3000
#sudo __nodialog=1 ./retropie_packages.sh setup eduke32

# Install Amiberry Raspberry Pi with SDL2 + DispmanX
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "  ... here comes Amiberry  :-)   "   
cd ~
 
  git clone https://github.com/midwan/amiberry
  cd amiberry
  make -j2 PLATFORM=rpi4
  sudo chmod -R 777 /home/amibian/amiberry

  clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "  Amiberry is compiled ...     " 


clear
toilet -F gay Pimiga3000

eecho " "
echo " "cho " ... lets configer ClassicWB"  
  # Preinstall Classic WB UAE
  mkdir /home/$USER/Amiga
  mkdir /home/$USER/Amiga/HDD
  mkdir /home/$USER/Amiga/FDD
  
  sudo mkdir /boot/Amiga
  sudo cp -R /home/$USER/amiberry/kickstarts /boot/Amiga
  cd cd ~/Amiga
  clear
  toilet -F gay Pimiga3000
  wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
  clear
  toilet -F gay Pimiga3000
  echo " "
  echo " "
  echo "  ClassicWB extracting ...     " 
  unzip ./ClassicWB_UAE_v28.zip
  
  clear
  toilet -F gay Pimiga3000
  echo " "
  echo " "
  echo "  Configure ClassicWB ...     " 
  mv /home/$USER/amiberry/ClassicWB_UAE_v28 /home/$USER/Amiga/HDD
 
  wget https://netcologne.dl.sourceforge.net/project/aros/nightly2/20210114/Binaries/AROS-20210114-raspi-armhf-system.tar.bz2
  #unzip ./AROS-20210114-raspi-armhf-system.tar.bz2
  
#Install PiKISS
toilet -F gay Pimiga3000
echo " "
echo " "
echo "  Here comes PiKiss :-)    " 
cd ~
git clone --depth=1 https://github.com/jmcerrejon/PiKISS

cd PiKISS
sudo chmod -R 777 ./piKiss.sh
clear
toilet -F gay Pimiga3000
echo " "
echo " "
echo "  PiKiss is ready for you...     " 
    echo "Here you can install additional software :-)"
    echo " · TIP: F12 = Menu."
    echo "I hardly recommend: Coolterm, Tweaks, ..."
    echo
    read -p "Press [ENTER] to continue..."
sudo ./piKiss.sh 


  
sudo apt-get -y autoremove
whiptail --msgbox " Ready,... Okey, here we are ... Lets Pimiga3000 (mini) :-)" 20 60 1
clear
toilet -F gay Pimiga3000
startx


