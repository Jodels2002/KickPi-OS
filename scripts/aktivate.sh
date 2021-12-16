cd
clear
toilet "KickPi-OS" --metal
echo "KickPI-OS ROM Operating System and Libraries" 
echo "Version V1.5 2020-2021 KickPi-OS "
echo "No Rights Reserved.  "
echo ""
echo -e -n "$BLACK Acitivating KickPi-OS..."
echo ""


BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'

export NEWT_COLORS='
	window=blue,lightgray
	border=white,gray
	textbox=black,gray
	button=black,white
	root=white,black
    border=black,lightgray
    shadow=black,gray
    title=gray,lightgray
    button=black,gray
    actbutton=white,lightgray
    compactbutton=black,lightgray
    checkbox=black,lightgray
    actcheckbox=lightgray,cyan
    entry=black,lightgray
    disentry=gray,lightgray
    label=gray,lightgray
    listbox=gray,lightgray
    actlistbox=black,cyan
    sellistbox=lightgray,black
    actsellistbox=lightgray,black
    textbox=black,lightgray
    acttextbox=black,cyan
    emptyscale=,gray
    fullscale=,cyan
    helpline=white,black
    roottext=lightgrey,black
'

desktop()
{
if  xset q &>/dev/null; then

	echo -e "$BLACK 1.>$GREEN Runs in Desktop Mode                                +"

else
	echo -e "$RED 1.>Scrict must run in Desktop mode!                           -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>First start the Linux desktop!                             -"
	echo -e "$RED 1.>            -"
	echo -e "$RED 1.>            -"



exit

fi
      
 }   


legal()
{
	 
	   echo -e  "$BLACK Check Folder AmigaForever Shared on your Desktop "
if    [  -d "/home/pi/Desktop/Shared/" ]; then
	
	
	  clear
          toilet "KickPi-OS" --metal
          echo " "
          echo " "
	  echo "***  Amiga Forever files found ***"
	  echo " "
	  whiptail --msgbox "Information: AmigaForever * by Cloanto 
	  \n 1>Please note that the Kickroms and Workbench
	  files are still under copyright! 
	  \n 1>So only use this image if you own  
	  original Amiga(s) or Amiga Forever. 
	  \n 1>CLI:               
	  \n 1>Assign >NIL: Greetings your´s B. Titze
     
	  \n " 20 50 1
	   # whiptail --msgbox "Optional: \n  \n  Now insert your * AMIGA * USB stick with the \n  * Shared * folder into the Raspberry" 15 50 1
	  echo "... copy files will take 2-5 min "
          
	  sudo rsync -av --ignore-existing /home/pi/Desktop/Shared/* ~/Amiga 
	  
	  exit
	  
else
	  echo -e  "$RED No Folder AmigaForever Shared on your Desktop "
	  fi
	  
	  
	 echo -e  "$BLACK Check AmigaForever8Plus.msi on your Desktop "
if [ -f /home/pi/Desktop/AmigaForever8Plus.msi ]; then
	echo -e "$BLACK 1.>$GREEN Found AmigaForever8Plus  +"
      	echo -e  ""
	echo "KickPI-OS ROM Operating System and Libraries" 
        echo "Version V1.5 2020-2021 KickPi-OS "
        echo -e  "CLI>Starting installation ..."
     	sudo apt install -y msitools
	cd /home/pi/Templates/
	msiextract /home/pi/Desktop/AmigaForever8Plus.msi
	cp -r -f "/home/pi/Templates/Program Files/Cloanto/Amiga Forever/Shared/"* /home/pi/Amiga/
	cp -r -f /usr/share/Shared/rom/* /home/pi/Amiga/rom/
	mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
	rm -d /home/pi/Amiga/rom/

 	cd
	sudo chmod -R 777 Amiga

    return 0
 fi


	 echo -e  "$BLACK Check AmigaForever9Plus.msi on your Desktop "  
if [ -f /home/pi/Desktop/AmigaForever9Plus.msi ]; then
      
      	echo -e "$BLACK 1.>$GREEN Found AmigaForever9Plus  +"
      	echo -e  ""
	sleep 2
        echo "KickPI-OS ROM Operating System and Libraries" 
        echo "Version V1.5 2020-2021 KickPi-OS "
        echo -e  "CLI>Starting installation ..."
     	sudo apt install -y msitools
	cd /home/pi/Templates/
	msiextract /home/pi/Desktop/AmigaForever9Plus.msi

	cp -r -f "/home/pi/Templates/Program Files/Cloanto/Amiga Forever/Shared/"* /home/pi/Amiga/
	cp -r -f /usr/share/Shared/rom/* /home/pi/Amiga/rom/
	mv /home/pi/Amiga/rom/* /home/pi/Amiga/kickstarts/
	rm -d /home/pi/Amiga/rom/

 	cd
	sudo chmod -R 777 Amiga

    return 0
  
 else
      echo -e " 1.>$RED No AmigaForever9Plus $BLACK on KickPi-OS Desktop"
      echo -e  "$BLUE 1.>First copy to the desktop:
      
      - AmigaForever9Plus.msi or
      - AmigaForever8Plus.msi or
      - Shared
      
      from Cloanto/Amiga Forever          -"
       echo -e  ""
        echo -e  ""
      
      echo -e  "$BLACK    Installation aborted... "
      echo -e  ""
      firefox https://www.amigaforever.com/
      
     sleep 30
	
  whiptail --msgbox "Information: \n  \n  AmigaForever9Plus * by Cloanto \n  No Cloanto/Amiga Forever files found \n " 20 50 1
  
 
 
    echo -e -n "$BLACK"
    echo "KickPI-OS ROM Operating System and Libraries" 
    echo "Version V1.5 2020-2021 KickPi-OS "
    echo ""

    echo -e  "CLI>"
   exit
  fi
  
}

hdd_space()

{
	    echo -e  ""
	echo -e -n "$BLACK Check free disk space..." 
	echo -e "$BLUE "
	df -H -l /root
	echo -e -n " "
FREE=`df -k --output=avail "$PWD" | tail -n1`   # df -k not df -h 


if [[ $FREE -lt  4000000 ]]; then               # 10G = 10*1024*1024k

     echo -e  "Installation aborted..."
     echo -e  "$RED 1.> Not enough disk space !                            -"
     echo -e "$BLUE  1.> You need 4GB Avial left! " 
     echo -e "$BLACK 1.> "
     echo -e  ""
     echo -e  "Installation aborted... "
    sleep 20
      
      echo -e  ""

	
  whiptail --msgbox "Information: \n  \n  Installation aborted... \n   \n you need more disk space! \n \n ..only 64GB SD or USB?" 20 50 1
     exit 
     
     else
     echo -e "$BLACK 1.>$GREEN Enough free space "  
     echo -e  ""   
  
     
fi 
}


desktop
sleep 3
hdd_space
sleep 3
legal
sleep 8
sudo rm -rf ~/Templates/*
sudo cp -R /opt/KickPi-OS/Amiga/AF/* /home/pi/Amiga/conf/
echo -e  "$BLACK "
echo "KickPI-OS ROM Operating System and Libraries" 
        echo "Version V1.5 2020-2021 KickPi-OS "
	echo -e  "CLI>Amiga files successfully updated ..."
sleep 8     
