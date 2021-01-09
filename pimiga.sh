
#!/bin/bash
# Install Pimiga - not for use!!!
# B.Titze 2020
#
# -language set for GB,DE,IT,ES..
# -OLED DISPLAY Amiga þ- bootpic... amyberry, amibian, Amiga Logo
# -since USBþStick possible... update BOOT and script create USBSTick (PI400) 
# -Customised Webadmin ( Amiga ) for access from Amiga Side
# -Preinstalled ClassicWB for amyberry..... -> extract HDF to folder for easy acces from Linux
# -Amibian Colour Menue in Amiga colours - consultation with G.K from Amibian! Only if its allowed
# -rename the Amibian Version of raspi-config ( Update proof) - consultation with G.K from Amibian! Only if its allowed
# Useful PiKiss Modules, CoolTerm, Certificates....stuff

echo " "
echo " "
echo " "

echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start a upgrade.... sit down and relaxe...!"
echo " "
echo "Backup Settings...."
sudo mkdir /home/amibian/.backup/
sudo mkdir /home/amibian/.backup/usr/
sudo chmod -R 777 /home/amibian/.backup/

sudo cp -R /home/amibian/.config/ /home/amibian/.backup/.config
sudo cp -R /home/amibian/.local/ /home/amibian/.backup/.local
sudo cp -R /usr/local/bin /home/amibian/.backup/usr


echo "Update Settings since LXDEPanel has a bug... to mutch applications on Dock ...No Image"
cd ~/Pimiga_mini
unzip ~/Pimiga_mini/.data.pac  ~/Pimiga_mini/.data
mv ~/Pimiga_mini/.data/.config/ ~/.config/



echo "XServer re-install.....# if needed :) "

#sudo apt-get -y remove --auto-remove xserver-common*
#sudo apt-get -y sudo apt-get purge openbox lxde

echo "Time to update:) "
sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

#restore.....#  if needed:) "
#sudo cp -R  /home/amibian/.backup/ usr/local/bin
cd ~

#Some little Tweaks....
sudo apt-get -y install openbox-menu openbox-themes obconf obconf-qt obmenu libfm-extra libfm-extra libfm-extra
sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
sudo apt-get install -y libraspberrypi-dev

#Some little Amiga stuff....
sudo apt-get -y install amiga-fdisk-cross buzztrax grafx2 protracker unadf worker xdms

sudo chmod -R 777 /usr/local/bin/
sudo chmod -R 777 /usr/local/share/
cd /home/amibian/


#Install Retropie/Setup

sudo apt-get install -y git dialog unzip xmlstarlet
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
sudo chmod -R 777 /home/amibian/RetroPie-Setup/
cd /home/amibian/RetroPie-Setup

sudo __nodialog=1 ./retropie_packages.sh setup basic_install
sudo __nodialog=1 ./retropie_packages.sh setup amiberry
sudo __nodialog=1 ./retropie_packages.sh setup vice
sudo __nodialog=1 ./retropie_packages.sh setup lr-vice
sudo __nodialog=1 ./retropie_packages.sh setup giana
sudo __nodialog=1 ./retropie_packages.sh setup eduke32

# Install Amiberry Raspberry Pi with SDL2 + DispmanX

cd ~
 
  #git clone https://github.com/midwan/amiberry
  #cd amiberry
  #make -j2 PLATFORM=rpi4
  #sudo chmod -R 777 /home/amibian/amiberry
  
#Install PiKISS
cd ~
git clone --depth=1 https://github.com/jmcerrejon/PiKISS

cd PiKiSS
sudo chmod -R 777 ./piKISS.sh
sudo ./piKiss.sh
  

# Compile WebAdmin https://127.0.0.1:10000

echo " "
echo " "
#echo "Webadmin install? Y/N"
echo " "
   
   
sudo apt-get  install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.920_all.deb
sudo dpkg --install webmin_1.920_all.deb

sudo apt-get autoremove
whiptail --msgbox " Ready... WebAdmin https://127.0.0.1:10000...Lets Pimiga :-)" 20 60 1
#Amibian permission for shure...
permission
sudo reboot
