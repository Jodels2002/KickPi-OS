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

