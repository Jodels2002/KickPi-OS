crontab -e
and setup it to be
*/10 * * * * /full/path/to/script.py

(crontab -l 2>/dev/null; echo "*/5 * * * * /usr/local/bin/loop.sh") | crontab -


#!/bin/bash
#***********************************************  #KickPi-OS Retropie content loader  ***********************************
# Install KickPi-OS
# B.Titze 2021
#***********************************************  #Some Info for the future  ***********************************
# not ready...sudo apt install -y.
# sudo apt install -y kdenlive kdenlive-data openshot libopenshot-audio6 libopenshot16 openshot-doc aseprite brasero chromium-codecs-ffmpeg
# sudo apt install -y games-finest gnome-twitch gnome-twitch-player-backend-gstreamer-clutter gnome-twitch-player-backend-gstreamer-cairo gnome-twitch-player-backend-gstreamer-opengl
# gnome-twitch-player-backend-mpv-opengl gnome-video-arcade gnome-video-effects handbrake kaffeine libavcodec-extra58
# pcsxr qmmp quicktime-utils radio videocut xserver-xorg-video-all youtube-dl minitube transmission
if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_UAE_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  Configure ClassicWB_UAE_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
      unzip -u ./ClassicWB_UAE_v28.zip
      else 
      echo " "
      
      fi
      
      if [ ! -f /home/$USER/Amiga/hdf/ClassicWB_OS39_v28.zip ]; then
      clear
      toilet "KickPi-OS" --metal
      toilet "full" --metal
      echo " "
      echo " "
      echo "  ClassicWB_OS39_v28 ...   " 
      echo " "
      echo " "
      wget http://download.abime.net/classicwb/ClassicWB_OS39_v28.zip
      unzip -u ./ClassicWB_OS39_v28.zip
      else 
      clear
      fi

      
if [ ! -d /home/$USER/RetroPie/roms/Amiga_WHD_Games ]; then
      clear
      toilet -F gay Retropie
      echo " "
      echo " "
      echo "  Configure Retropie Romset from Archiv.org " 
      echo " "
      echo " "
      cd /home/$USER/RetroPie/roms
      #wget https://archive.org/compress/Amiga_WHD_Games
      #unzip -u /home/$USER/RetroPie/roms/Amiga_WHD_Games
      
      else 
      clear
      
      fi
      #CommanderPi  Is out...User interaktiviti needed... 
      cd
      sudo apt install -y python-pil python3-pil python3-pil.imagetk-dbg python-pil-doc 
      git clone --depth=1 https://github.com/Jack477/CommanderPi
      clear
      toilet "KickPi-OS" --metal             full
      
      cd CommanderPi
      ./install.sh
      
     
      
    # Is out...takes too long time... 
     if [ ! -d /home/pi/winetricks ]; then
        clear
       toilet "KickPi-OS" --metal
        toilet -F gay full
        echo " Wine" 
        cd 
        sudo apt -y install  playonlinux
       wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
      	 chmod +x winetricks
      	 sh winetricks corefonts vcrun6 
       else 
       clear
      
       fi
if ! grep -q 'init-poky' /etc/fstab ; then
   sudo mkdir /media/RAM
   sudo chmod -R 777 /etc/fstab
   sudo  echo '# init-poky' >> /etc/fstab
   echo 'tmpfs /media/RAM tmpfs nodev,nosuid,size=1024M 0 0 ' >> /etc/fstab
fi
