
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

# https://vps691225.ovh.net/download/builds/AROS/   https://github.com/deadw00d/AROS
# https://github.com/rewtnull/amigafonts
# https://github.com/henrikstengaard
# https://github.com/HoraceAndTheSpider/RetroPieAmigaSetup
# https://github.com/HoraceAndTheSpider/UAEConfigMaker
# https://github.com/Lana-chan/nes-boingball :-) 
# https://github.com/x64k/amitk
# https://github.com/alpine9000/squirt
# Host: grandis.nu
# Port: 21
# Username: ftp
# Password: any password will do
# ftp://ftp:amiga@grandis.nu/Retroplay%20WHDLoad%20Packs/

# 11.01.2021 Amibian update & Settings Ok 
# 11.01.2021 PiKiss OK -> todo CoolTerm, Certificates 
# 18.01 Menu & Funktions

if [ "$(whoami &2>/dev/null)" == "root" ] && [ "$(id -un &2>/dev/null)" == "root" ]
      then
      echo "Don't be root to run this script!"
      echo "Pleas don't use 'sudo !!'"
      exit 1
fi

sudo chmod -R 777 /home/$USER/Pimiga_mini  

sudo pacman -S --noconfirm update 
sudo pacman -S --noconfirm toilet
sudo pacman -S --noconfirm dialog
sudo pacman -S --noconfirm mc git 
unzip ~/Pimiga_mini/data.pac
clear  
toilet -F gay Pimiga3000

#/home/$USER/Pimiga_mini/LED/LED.sh
#python /home/$USER/Pimiga_mini/OLED/Amiga.py

echo " "
echo " "
echo " "
echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start ..."
echo " "
echo "Backup Settings...."

mkdir /home/$USER/.backup/
sudo chmod -R 777 ~/.backup/
#cp -R ~/.config/ ~/.backup/.config
#cp -R ~/.local/ ~/.backup/.local
#cp -R /usr/local/bin ~/.backup/usr

#****************************************************************************************************************

HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="Pimiga3000"
TITLE="Pimiga3000 mini"
MENU="Please select:"

OPTIONS=(1 "Install Pimiga3000"
         2 "Install Pimiga3000, Retropie & Tools"
         3 "Install Pimiga3000, Pimiga3000 Desktop, Retropie & Tools")

CHOICE=$(dialog --clear \
                --backtitle "$Pimiga3000" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear

 #****************************************************************************************************************

cd ~/Pimiga_mini
clear
toilet -F gay Pimiga3000


#****************************************************************************************************************
Pimiga_Desktop() {
      clear
      toilet -F gay Pimiga3000 
   
   echo "Installing Pimiga3000 Desktop ..."

      #echo "Update Settings since LXDEPanel has a bug... to mutch applications on Dock ...No Image"
      # Make fresh install
      
      sudo apt purge -y xorg xserver-xorg lxde raspberrypi-ui-mods lxde-common lxde-core
      #sudo pacman -S --noconfirm install deborphan
      #sudo pacman -S --noconfirm autoremove --purge libx11-.* lxde-.* 
      #sudo pacman -S --noconfirm autoremove --purge $(deborphan)
      #sudo pacman -S --noconfirm autoremove --purge
      #sudo pacman -S --noconfirm autoclean
      
      
      # Fresh install XFCE4
      sudo pacman -S --noconfirm xserver-xorg xfce4 xfce4-goodies lxinput
      sudo systemctl set-default graphical.target
      sudo update-alternatives --config x-window-manager
      #sudo pacman -S --noconfirm thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk
      
      rm -r ~/.config
      mkdir ~/.config
      rm -r ~/.local
      mkdir ~/.local
      mv ~/Pimiga_mini/.data/.config/ /home/$USER/
      mv ~/Pimiga_mini/.data/.local/ /home/$USER/
      #mv ~/Pimiga_mini/Amiga_Logos/ /home/$USER/.local/
      
      #mv ~/Pimiga_mini/.data/.config/lxsession ~/.config/lxsession
      #mv ~/Pimiga_mini/.data/.config/lxterminal ~/.config/lxterminal
      
      # Fresh install Amiga Desktop
      cd /usr/share/icons/
      sudo cp -R /home/$USER/Pimiga_mini/Amiga_Logos /usr/share/icons
      sudo cp -R /home/$USER/Pimiga_mini/.data/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip /usr/share/icons/AMIGAOSLINUX.zip
      sudo cp -R /usr/share/icons/AMIGAOSLINUX/scalable/ /usr/share/icons/Tango
      sudo cp -R /usr/share/icons/AMIGAOSLINUX/scalable/ /usr/share/icons/gnome
      sudo cp -R /usr/share/icons/AMIGAOSLINUX/scalable/ /usr/share/icons/nuoveXT2/
      sudo cp -R /usr/share/icons/AMIGAOSLINUX/scalable/ /usr/share/icons/Adwaita/
      
      cd /home/$USER/Pimiga_mini/Amiga_Logos
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      sudo cp -R /home/$USER/Pimiga_mini/Amiga_Logos/amigaos_xfwm4_themes ~/themes
      
      #I am combining the theme with the Amiga3.x gtk2 theme from untouchable89:
      #http://xfce-look.org/content/show.php/Amiga3.x?content=127251

      #These mousepointers from xBreeze are great with the theme, too:
      #http://xfce-look.org/content/show.php/Amiga+Classic+Red?content=128152

      #Use it with the one and only Topaz font here:
      #https://github.com/rewtnull/amigafonts
      
      
      #sudo chmod -R 777 /home/$USER/
}
 #****************************************************************************************************************
Pimiga_Update() {

clear
toilet -F gay Pimiga3000

echo " "
echo " "
echo "            Time to update:)              "


      echo "Installing Pimiga3000 Update System ..."
      sudo pacman -S --noconfirmyyu

}

#****************************************************************************************************************

Pimiga_Tools() {

clear
toilet -F gay Pimiga3000

echo " "
echo " "
echo "            Lets install some usefull Tools:)              "
echo " "
echo " "

      sudo pacman -S --noconfirm  geany geany-plugins-common geany-common imagemagick gparted synaptic chromium-browser
      sudo pacman -S --noconfirm install openbox-menu  obmenu 
      sudo pacman -S --noconfirm libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
      sudo pacman -S --noconfirm libraspberrypi-dev

      clear
      toilet -F gay Pimiga3000
      #Some little Amiga stuff....
      sudo pacman -S --noconfirm install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms
      clear
      toilet -F gay Pimiga3000
      
      
}
 
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
      sudo pacman -S --noconfirm git dialog unzip xmlstarlet
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
 #****************************************************************************************************************
     
     Pimiga_Amiberry() {
      # Install Amiberry Raspberry Pi with SDL2 + DispmanX
      
      clear
      toilet -F gay Pimiga3000
     
      echo " "
      echo "  ... here comes Amiberry  :-)   " 
      echo " "
      echo " "  
      cd ~
      sudo pacman -S --noconfirm base-devel sdl2 sdl2_ttf sdl2_image libxml2 flac mpg123 libmpeg2
      sudo pacman -S --noconfirm libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev

      git clone https://github.com/midwan/amiberry
      cd amiberry
       make -j2 PLATFORM=pi64

      sudo chmod -R 777 /home/$USER/amiberry
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Amiberry is compiled ...     " 
      echo " "
      echo " "
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo "  ... lets configer ClassicWB" 
      echo " "
      echo " " 
      # Preinstall Classic WB UAE
      mkdir /home/$USER/Amiga
      mkdir /home/$USER/Amiga/HDD
      mkdir /home/$USER/Amiga/FDD
      
      cp -R /home/$USER/Pimiga_mini/.data/Amiga/Floppys/Workbench/ /home/$USER/Amiga/FDD/
      cp -R /home/$USER/Pimiga_mini/.data/Amiga/Floppys/sysinfo.ADF /home/$USER/Amiga/FDD/
     
      cp -R /home/$USER/amiberry/kickstarts/ /home/$USER/Amiga/
      cp -R /home/$USER/Pimiga_mini/.data/Amiga/kickstarts /home/$USER/Amiga/
  
      sudo mkdir /boot/Amiga
      sudo chmod -R 777 /home/$USER/Amiga
      
      cd ~/Amiga
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo "  ... downloading  ClassicWB"  
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      wget https://misapuntesde.com/res/Amiga_roms.zip
      wget https://preterhuman.net/software/download/261/
      
      
      echo " "
      echo "  ... downloading  AROS " 
      wget https://vps691225.ovh.net/download/builds/AROS/amiga-m68k-20201206-135516.tar.gz --no-check-certificate
        

      cd ~/Amiga
      clear
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  ClassicWB extracting ...     " 
      echo " "
      echo " "
      unzip ./ClassicWB_UAE_v28.zip
      mv "/home/$USER/Amiga/ClassicWB_UAE_v28/Hard Disk/" /home/$USER/Amiga/HDD/
      mv "/home/pi/Amiga/HDD/Hard Disk/" /home/$USER/Amiga/HDD/ClassicWB
      rm -r ~/Amiga/ClassicWB_UAE_v28
      mv ./Amiga_roms.zip /home/$USER/Amiga/kickstarts/
      cd ~/Amiga/kickstarts/
      unzip ./Amiga_roms.zip
	  rm -r ./Amiga_roms.zip
	  cd ~/Amiga
      cp -R ~/.index.html /home/$USER/Amiga/FDD/Workbench/workbench3.1.zip
      cd /home/$USER/Amiga/FDD/Workbench/
      unzip ./workbench3.1.zip
	  rm -r ./workbench3.1.zip
      
      cd ~/Amiga
      
      clear
      
      toilet -F gay Pimiga3000
      echo " "
      echo " "
      echo "  Configure ClassicWB ...     " 
      echo " "
      echo " "
        cd ~/Amiga
        
        
        
       
        
        # Preinstall AROS
        echo " "
        echo " "
        echo "  Configure AROS...     " 
        echo " "
        echo " "
        
        cd /home/$USER/Amiga/
        gunzip ./amiga-m68k-20201206-135516.tar.gz
        tar -xvf ./amiga-m68k-20201206-135516.tar
        
        mv  "/home/$USER/Amiga/amiga-m68k-20201206-135516/" /home/$USER/Amiga/HDD/
        mv "/home/pi/Amiga/HDD/amiga-m68k-20201206-135516" /home/$USER/Amiga/HDD/AROS
      
      
      sudo chmod -R 777 /home/$USER/Amiga
      sudo chmod -R 777 /home/$USER/amiberry
      
    }
    
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
      /home/pi/PiKISS/scripts/emus/amiga.sh
}
 #****************************************************************************************************************


 cd ~
clear
toilet -F gay Pimiga3000

case $CHOICE in
        1)
            echo "Pimiga3000"
            Pimiga_Tools
            Pimiga_PiKiss
            Pimiga_Amiberry
            ;;
        2)
            echo "Pimiga3000, Retropie & Tools"
            Pimiga_Update
            Pimiga_Tools
            Pimiga_Amiberry
            Pimiga_Retropie
            Pimiga_PiKiss
            ;;
        3)
            echo "Pimiga3000, Pimiga3000 Desktop, Retropie & Tools"
           
            Pimiga_Desktop
            Pimiga_Update
            Pimiga_Tools
            Pimiga_PiKiss
            Pimiga_Amiberry
            Pimiga_Retropie
          
            
            ;;
esac



clear
toilet -F gay Pimiga3000

echo " "
      echo " "
      echo "  ... cleanup and finish setup  "   
      sudo pacman -S --noconfirm autoremove
      sudo chmod -R 777 /usr/local/bin/
      sudo chmod -R 777 /usr/local/share/
      sudo chmod -R 777 /home/$USER/.backup/
      sudo chmod -R 777 /home/$USER/.config/
      sudo chmod -R 777 /home/$USER/.local/

    #  whiptail --msgbox " Ready,... Okey, here we are ... Lets Pimiga3000 (mini) :-)" 20 60 1
clear
toilet -F gay Pimiga3000
#startx







