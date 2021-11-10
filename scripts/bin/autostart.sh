#!/usr/bin/env bash

# local mode="amiberry"
# local mode="startx"


function _autostart_script_autostart() {
    local mode="$1"
    # delete old startup script
    rm -f /etc/profile.d/10-emulationstation.sh
    rm -f /etc/profile.d/KickPi-OS.sh

    local script="/home/$USER/.config/autostart/autostart.sh"

    cat >/etc/profile.d/KickPi-OS.sh <<_EOF_
# launch our autostart apps (if we are on the correct tty and not in X)
if [ "\`tty\`" = "/dev/tty1" ]; then
    bash "$script"
fi
_EOF_

    touch "$script"
    # delete any previous entries for emulationstation / kodi in autostart.sh
    sed -i '/#auto/d' "$script"
    # make sure there is a newline
    sed -i '$a\' "$script"
    case "$mode" in
        amiberry)
            echo -e "amiberry #auto" >>"$script"
            ;;
        desktop|*)
            echo "startx #auto" >>"$script"
            ;;
    esac
    chown $user:$user "$script"
}

function enable_autostart() {
	
# local mode="amiberry"
# local mode="startx"
    local mode="amiberry"
   mkdir /home/$USER/.config/autostart/
    
        
         raspi-config nonint do_boot_behaviour B2
        

        _autostart_script_autostart "$mode"
    
}



function remove_autostart() {
        rm -f /etc/profile.d/10-emulationstation.sh
        rm -f /etc/profile.d/10-retropie.sh
        rm -f /etc/profile.d/KickPi-OS.sh
}


    cmd=(dialog --backtitle "KickPi-OS Autostart Menu" --menu "Choose the desired boot:" 22 76 16)
    while true; do
        
            options=(
                1 "Start Amiberry at boot"
                2 "Start KickPi-OS at boot"
                
            )
        
        choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        if [[ -n "$choice" ]]; then
            case "$choice" in
                1)
                     mode="amiberry"
                     enable_autostart
                     printMsgs "dialog" "Amiberry is set to autostart after login."
                      
                    ;;
                2)
                    mode="startx" 
                    enable_autostart kodi
                    printMsgs "dialog" "KickPi-OS is set to launch at boot."
                    
                    ;;
             
            esac
        else
            break
        fi
    done

