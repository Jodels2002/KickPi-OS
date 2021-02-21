#!/usr/bin/env bash

# mode="amiberry"
# mode="desktop"
# mode="console"
#

mode="console"
function _update_hook_autostart() {
    if [[ -f /etc/profile.d/KickPi-OS.sh ]]; then
        enable_autostart
    fi
}

function _autostart_script_autostart() {
    local mode="console"
    # delete old startup script
    rm -f /etc/profile.d/10-emulationstation.sh
    rm -f /etc/profile.d/KickPi-OS.sh
    local script="/home/$USER/.KickPi-OS/autostart/autostart.sh"

    cat >/etc/profile.d/KickPi-OS.sh <<_EOF_
# launch our autostart apps
if [ "\`tty\`" = "/dev/tty1" ]  then
    bash "$script"
fi
_EOF_

    touch "$script"
    # delete any previous entries
    sed -i '/#auto/d' "$script"
    # make sure there is a newline
    sed -i '$a\' "$script"
    case "$mode" in
        amiberry)
            echo -e "amiberry" >>"$script"
            ;;
        desktop)
            echo "KickPi-OS Desktop" >>"$script"
            ;;
    esac
    chown $USER:$USER "$script"
}

function enable_autostart() {
    local mode="amiberry"

    
            # remove any old autologin.conf
            rm -f /etc/systemd/system/getty@tty1.service.d/autologin.conf
            raspi-config nonint do_boot_behaviour B2
            
      
            mkdir -p /etc/systemd/system/getty@tty1.service.d/
            cat >/etc/systemd/system/getty@tty1.service.d/autologin.conf <<_EOF_
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $user --noclear %I \$TERM
_EOF_
       

        _autostart_script_autostart "$mode"
   
}

function disable_autostart() {
    local login_type="$1"
    [[ -z "$login_type" ]] && login_type="B2"
    if isPlatform "x11"; then
        rm "$home/.config/autostart/retropie.desktop"
    else
        if [[ "$__os_id" == "Raspbian" ]]; then
            if [[ "$__chroot" -eq 1 ]]; then
                systemctl set-default graphical.target
                ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
            else
                raspi-config nonint do_boot_behaviour "$login_type"
            fi
        elif [[ "$(cat /proc/1/comm)" == "systemd" ]]; then
            rm -f /etc/systemd/system/getty@tty1.service.d/autologin.conf
            systemctl set-default graphical.target
            systemctl enable lightdm.service
        fi
        rm -f /etc/profile.d/10-emulationstation.sh
        rm -f /etc/profile.d/10-retropie.sh
    fi
}

function remove_autostart() {
    disable_autostart
}


    cmd=(dialog --backtitle "Autostart Menu" --menu "Choose the desired KickPi-OS boot" 22 76 16)
    while true; do
        if isPlatform "x11"; then
            local x11_autostart
            if [[ -f "$home/.config/autostart/retropie.desktop" ]]; then
                options=(1 "Autostart Amiberry after login (Enabled)")
                x11_autostart=1
            else
                options=(1 "Autostart Amiberry after login (Disabled)")
                x11_autostart=0
            fi
        else
            options=(
                1 "Start Amiberry at boot"
                2 "Start KickPi/OS Desktop at boot "
                E "Manually edit Autostart"
            )
            if [[ "$__os_id" == "Raspbian" ]]; then
                options+=(
                    CL "Boot to text console (require login)"
                    CA "Boot to text console (auto login as $user)"
                )
            fi
            options+=(DL "Boot to desktop (require login)")
            if [[ "$__os_id" == "Raspbian" ]]; then
                options+=(DA "Boot to desktop (auto login as $user)")
            fi
        fi
        choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        if [[ -n "$choice" ]]; then
            case "$choice" in
                1)
                    if isPlatform "x11"; then
                        if [[ "$x11_autostart" -eq 0 ]]; then
                            enable_autostart
                            printMsgs "dialog" "Amiberry  is set to autostart after login."
                        else
                            disable_autostart
                            printMsgs "dialog" "Autostarting of Amiberry  is disabled."
                        fi
                        x11_autostart=$((x11_autostart ^ 1))
                    else
                        enable_autostart
                        printMsgs "dialog" "Amiberry is set to launch at boot."
                    fi
                    ;;
                2)
                    enable_autostart desktop
                    printMsgs "dialog" "KickPi-OS is set to launch at boot."
                    ;;
                E)
                    editFile "/home/$USER/.KickPi-OS/autostart/autostart.sh"
                    ;;
                CL)
                    disable_autostart B1
                    printMsgs "dialog" "Booting to text console (require login)."
                    ;;
                CA)
                    disable_autostart B2
                    printMsgs "dialog" "Booting to text console (auto login as $user)."
                    ;;
                DL)
                    disable_autostart B3
                    printMsgs "dialog" "Booting to desktop (require login)."
                    ;;
                DA)
                    disable_autostart B4
                    printMsgs "dialog" "Booting to desktop (auto login as $user)."
                    ;;
            esac
        else
            break
        fi
    done
