#!/bin/bash
# Assign >NIL:  Install KickPi-OS
# Assign >NIL:  B.Titze 2021
#******************************************** #startup-sequence  :-) ************* ********************************************

clear
echo "Welcome to KickPi-OS"
echo " "
echo "Assign >NIL:  Install KickPi-OS"
echo "Assign >NIL:  B.Titze 2021 "

# https://silocitylabs.com/post/2019/06/13/ultra-minimal-raspbian-image-for-pi-zero-and-zero-w/
# dwc_otg.lpm_enable=0 console=tty1 root=PARTUUID=8b037108-02 rootfstype=ext4 elevator=deadline fsck.repair=no quiet rootwait
apt-get purge --yes --auto-remove openssh-server
apt-get purge --yes --auto-remove aptitude aptitude-common apt-listchanges apt-utils blends-tasks xserver-common x11-xfs-utils x11-xserver-utils xinit libsmbclient blt gvfs gvfs-backends gvfs-daemons gvfs-fuse idle idle-python2.7 idle3 libaudio2 libice6 liblightdm-gobject-1-0 libpulse0 libqt4-svg libqtgui4 libsdl-image1.2 libsdl-mixer1.2 libsdl-ttf2.0-0 libsdl1.2debian libsm6 libsmpeg0 libwebkitgtk-1.0-0 libwebkitgtk-3.0-0 libxaw7 libxklavier16 libxmu6 libxss1 libxt6 libxtst6 lightdm lightdm-gtk-greeter lxde lxde-core midori obconf openbox python-pygame python-tk python3-tk scratch tk8.5 wpagui x11-common x11-utils x11-xkb-utils xinit xserver-common xserver-xorg xserver-xorg-core xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-video-fbdev zenity xserver* x11-common x11-utils x11-xkb-utils x11-xserver-utils xarchiver xauth xkb-data console-setup xinit lightdm libx{composite,cb,cursor,damage,dmcp,ext,font,ft,i,inerama,kbfile,klavier,mu,pm,randr,render,res,t,xf86}* lxde* lx{input,menu-data,panel,polkit,randr,session,session-edit,shortcut,task,terminal} obconf openbox gtk* libgtk* alsa*  python-pygame python-tk python3-tk scratch tsconf desktop-file-utils cifs-utils samba-common smbclient scratch debian-reference-en dillo idle3 python3-tk idle python-pygame python-tk lightdm gnome-themes-standard gnome-icon-theme raspberrypi-artwork gvfs-backends gvfs-fuse desktop-base lxpolkit zenity xdg-utils mupdf gtk2-engines alsa-utils lxde lxtask menu-xdg gksu midori xserver-xorg xinit xserver-xorg-video-fbdev libraspberrypi-dev libraspberrypi-doc dbus-x11 libx11-6 libx11-data libx11-xcb1 x11-common x11-utils lxde-icon-theme gconf-service gconf2-common udhcpd avahi-daemon gcc-arm-linux-gnueabihf  geoip-database libgdbm* libperl* make patch perl perl-modules-* cups* rsync bluez bluez-firmware pi-bluetooth scratch debian-reference-en dillo idle3 python3-tk idle python-pygame python-tk lightdm gnome-themes-standard gnome-icon-theme raspberrypi-artwork gvfs-backends gvfs-fuse desktop-base lxpolkit zenity xdg-utils mupdf gtk2-engines alsa-utils lxde lxtask menu-xdg gksu midori xserver-xorg xinit xserver-xorg-video-fbdev libraspberrypi-dev libraspberrypi-doc dbus-x11 libx11-6 libx11-data libx11-xcb1 x11-common x11-utils lxde-icon-theme gconf-service gconf2-common firmware-atheros samba-common plymouth
apt-get autoremove --purge   
find / -type f -name "*.conf" |xargs sed -i '\#^//#d'
cat > /etc/apt/apt.conf.d/80noadditional <<"EOF"
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

cat > /etc/dpkg/dpkg.cfg.d/nodoc <<"EOF" 
path-exclude /usr/share/doc/* path-include /usr/share/doc/*/copyright path-exclude /usr/share/man/* path-exclude /usr/share/groff/* path-exclude /usr/share/info/* path-exclude /usr/share/lintian/* path-exclude /usr/share/linda/*
EOF

cat > /etc/dpkg/dpkg.cfg.d/nolocale <<"EOF"
path-exclude /usr/share/locale/*
EOF

find /usr/share/doc -depth -type f ! -name copyright | xargs rm
find /usr/share/doc -depth -type f ! -name copyright | xargs rm -f
find /usr/share/doc -empty | xargs rmdir
rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/*
rm -rf /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*
rm -rf /usr/share/locale/*
rm -f /var/log/{auth,boot,bootstrap,daemon,kern}.log
rm -f /var/log/{debug,dmesg,messages,syslog}
cat /dev/null > /etc/motd
systemctl disable hciuart
systemctl disable dphys-swapfile.service
systemctl disable apt-daily.service
systemctl disable apt-daily.timer
systemctl disable nfs-client.target
systemctl disable remote-fs.target
systemctl disable apt-daily-upgrade.timer
systemctl disable nfs-config.service
apt-get clean


      sudo apt -y update
      sudo apt-get install -y toilet dialog mc zip unzip
      clear
      toilet "KickPi-OS" --metal

      echo " "
      echo "rebooting now ..."

mkdir /home/$USER/Amiga   
sudo chmod -R 777 /home/$USER/Amiga 
sudo cp -R /home/$USER/KickPi-OS/scripts/* /usr/local/bin	 
sudo cp -R /boot/config.txt /boot/config_backup.txt
# cp  /home/$USER/KickPi-OS/scripts/bashrc /home/$USER/.bashrc

sudo raspi-config nonint do_boot_behaviour B2



sudo reboot
