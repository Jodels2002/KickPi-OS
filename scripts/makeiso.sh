# https://www.piprojects.net/usb-bootstick-selbst-erstellen/

cd
sudo  apt-get install syslinux
syslinux --mbr --active --directory /boot/syslinux/ --install /dev/sdb #im Beispiel wäre der USB Stick sdb

#syslinux.cfg
#DEFAULT vesamenu.c32 # ist nötig damit man weiter untenMENU BACKGROUND ein Bild als Hintergrund einfügen kann
#PROMPT 0
#MENU TITLE PiProjects Tech-CD v1.0 # könnt Ihr ändern in einen Titel der euch gefällt
#MENU BACKGROUND splash.jpg # Das besagte Bild
#TIMEOUT 60 # nach welcher Zeit automatisch von HDD gestartet werden soll
#MENU WIDTH 78 # Breite des Menüs
#MENU ROWS 14 # Zeilen für die Auswahl
#MENU TIMEOUTROW 17 # Zeile in der die Timeout Zeit angezeigt wird
#MENU TABMSGROW 18 #
#MENU CMDLINEROW 18 #
#MENU HELPMSGROW 24 # Hilfsanzeige mit Infos zur jeweiligen auswahl
#MENU HELPMSGENDROW 25
#MENU IMMEDIATE








https://partclone.org/

partclone.dd -d -s /dev/hda1 -o hda1.dd.img


mkdir ~/bin
$ wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -P ~/bin
$ chmod +x ~/bin/pishrink.sh

### Vorhandenes RasPi-Image verkleinern:
$ sudo pishrink.sh raspberry-pi.img

### Image verkleinern und Original behalten:
$ sudo pishrink.sh raspberry-pi.img raspberry-pi_pishrink.img



# Retropei Manager
- HTMLTemplate: https://html5up.net/hyperspace
- https://www.fabianflu.ch/raspberry-pi-webradio-extended-edition/ 

Webmin
https://raspberrytips.com/install-webmin-raspberry-pi/


https://libraries.io/github/botolo78/RetroPie-Manager

#Cockpit: 
cd

rmdir --ignore-fail-on-non-empty cockpit-0.99

sudo apt-get install -y libpam-dev libkeyutils-dev glib-networking npm
sudo apt-get install -y autoconf intltool libglib2.0-dev libsystemd-journal-dev libjson-glib-dev libpolkit-agent-1-dev libkrb5-dev libssh-dev

wget https://github.com/cockpit-project/cockpit/archive/0.99.zip && unzip 0.99.zip
chmod -R 777 cockpit-0.99
cd cockpit-0.99

./autogen.sh --disable-pcp --disable-doc

make
sudo make install
sudo cp ../src/bridge/cockpit.pam.insecure /etc/pam.d/cockpit
sudo sh -c "cat ../src/bridge/sshd-reauthorize.pam >> /etc/pam.d/sshd"

sudo systemctl start cockpit.socket 
sudo systemctl enable cockpit.socket

echo "Installation completed.  http://<Raspberry  Hostname or IP >:9090
sudo reboot

