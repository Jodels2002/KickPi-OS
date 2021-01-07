
#!
# Install Pimiga
# B.Titze 2020



echo " "
echo " "
echo " "

echo "Pimiga3000 mini  Setup"
echo " "
echo " "
echo "Lets start a upgrade.... sit down and relaxe...!"
echo " "
echo "XServer Update.....# For shure :) "

#sudo apt-get remove --auto-remove xserver-common*
sudo apt-get -y update 
sudo apt-get -y upgrade


sudo apt-get -y install git mc xorg lxde
cd /home/amibian/
#Some little Tweaks....LXDE
git clone https://github.com/chjj/compton.git
cd compton
make
sudo make install
sudo./compton -cCf -D 5

cp -r /usr/share/themes/Clearlooks ~
cd
mv Clearlooks Pimiga
sudo ln -s Pimiga /usr/share/lxdm/themes

sudo apt-get install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 libxml2 flac mpg123 libmpeg2-4
sudo apt-get install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libxml2-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev
sudo apt-get install -y libraspberrypi-dev
sudo chmod -R 777 /usr/local/bin/
sudo chmod -R 777 /usr/local/share/
cd /home/amibian/
#sudo apt-get -y install xfce4

  #Install Retropie/Setup

sudo apt-get install -y git dialog unzip xmlstarlet
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git

sudo chmod -R 777 /home/amibian/RetroPie-Setup/
cd /home/amibian/RetroPie-Setup

sudo __nodialog=1 ./retropie_packages.sh setup basic_install
sudo __nodialog=1 ./retropie_packages.sh setup amiberry
sudo __nodialog=1 ./retropie_packages.sh setup vice
sudo __nodialog=1 ./retropie_packages.sh setup lr-vice
#sudo __nodialog=1 ./retropie_packages.sh setup giana
#sudo __nodialog=1 ./retropie_packages.sh setup eduke32

# Install Amiberry

cd /home/amibian/
 
  git clone https://github.com/midwan/amiberry
  
  cd amiberry
  
 # Compile Amiberry
   make -j2 PLATFORM=rpi4
   

  sudo chmod -R 777 /home/amibian/amiberry
  
#Install PiKISS
cd /home/amibian/
git clone --depth=1 https://github.com/jmcerrejon/PiKISS
sudo chmod -R 777 PiKISS
cd PiKiSS

sudo ./piKISS.sh
  

# Compile WebAdmin https://127.0.0.1:10000

echo " "
echo " "
#echo "Webadmin install? Y/N"
echo " "
   
   
#sudo apt-get  install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
#wget http://prdownloads.sourceforge.net/webadmin/webmin_1.920_all.deb
#sudo dpkg --install webmin_1.920_all.deb

sudo apt-get autoremove
#whiptail --msgbox " Ready... WebAdmin https://127.0.0.1:10000...Lets Amiga :-)" 20 60 1
permission
sudo reboot
