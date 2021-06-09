

#install box86
sudo apt -y install box86


pkill -9 wine
sudo apt purge -y wine &>/dev/null &

# Remove old wine, while leaving config intact
sudo rm -rf /usr/local/bin/wine /usr/local/bin/wineboot /usr/local/bin/wineserver /usr/local/bin/winecfg /usr/local/bin/winetricks ~/wine.tgz ~/wine ~/.cache/winetricks ~/.cache/wine 2>/dev/null

wget https://twisteros.com/wine.tgz -O ~/wine.tgz || error 'Failed to download wine!'
tar zxf ~/wine.tgz || error 'Failed to extract wine!'
# rm ~/wine.tgz

# Install
#sudo ln -s ~/wine/bin/wine /usr/local/bin/wine
sudo ln -s ~/wine/bin/winecfg /usr/local/bin/winecfg
sudo ln -s ~/wine/bin/wineserver /usr/local/bin/wineserver
sudo ln -s ~/wine/bin/wineboot /usr/local/bin/wineboot

echo "#!/bin/bash
setarch linux32 -L $HOME/wine/bin/wine"' "$@"' | sudo tee /usr/local/bin/wine >/dev/null
sudo chmod +x /usr/local/bin/wine /usr/local/bin/wineboot /usr/local/bin/wineserver /usr/local/bin/winecfg
sudo wget https://cdn.discordapp.com/attachments/736736690932285481/793931182249213972/winetricks -O /usr/local/bin/winetricks || error "Failed to get winetricks!"
sudo sed -i 's|echo "${arg%%=*}"=\""${arg#*=}"\"|echo ${arg%%=*}=\"${arg#*=}\"|g' sudo chmod +x /usr/local/bin/wine
sudo chmod +x sudo chmod +x /usr/local/bin/winetricks 



#create menu button to winecfg
echo "[Desktop Entry]
StartupNotify=true
Terminal=false
Type=Application
Name=Wine Configuration
Exec=wine winecfg
Icon=$(dirname "$0")/icon-64.png
Categories=System;
Comment=Configure wine" > ~/.local/share/applications/wine-config.desktop

echo "[Desktop Entry]
Name=Winetricks
Comment=Work around problems and install applications under Wine
Exec=bash -c 'BOX86_NOBANNER=1 box86 winetricks --gui'
Terminal=false
Icon=$(dirname "$0")/icon-64.png
Type=Application
Categories=System;" > ~/.local/share/applications/wine-tricks.desktop

echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Wine Desktop
Comment=Wine graphical desktop environment to mimic a Windows OS
Icon=$(dirname "$0")/icon-64.png
Exec=wine explorer /desktop=shell,1280x720
Terminal=false
Categories=System;" > ~/.local/share/applications/wine-explorer.desktop

echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Wine Program Manager
Comment=Install/Remove Windows programs
Icon=$(dirname "$0")/icon-64.png
Exec=wine uninstaller
Terminal=false
Categories=System;" > ~/.local/share/applications/wine-uninstaller.desktop

echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Wine Task Manager
Comment=View running processes within Wine
Icon=$(dirname "$0")/icon-64.png
Exec=wine taskmgr
Terminal=false
Categories=System;" > ~/.local/share/applications/wine-taskmgr.desktop

# Boot wine (make fresh wineprefix in ~/.wine
BOX86_NOBANNER=1
setarch linux32 -L box86 ~/wine/bin/wine wineboot

#wait until above process exits
while [ ! -z "$(pgrep -i 'wine C:')" ];do
  sleep 1
done
echo "First wineboot finished. Now updating wine prefix..."

#update the wine prefix (~/.wine) to fix the issue that causes wine to not know its system drive
#running as background process - terminal will exit but that's ok
setsid wine wineboot -u

      
      
      cd
       #wget -nc https://download.abime.net/winuae/releases/InstallWinUAE4400.msi
      
       #wine msiexec /i InstallWinUAE4400.msi
      #wget https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe
     wine msiexec /i ~/Desktop/AmigaForever9Plus.msi
