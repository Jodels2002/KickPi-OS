#!/bin/bash

cd /home/pi/RetroPie-Setup
sudo ./home/pi/RetroPie-Setup/retropie_packages.sh
sudo ./home/pi/RetroPie-Setup/scriptmodules/system.sh
sudo ./home/pi/RetroPie-Setup/scriptmodules/helpers.sh
sudo ./home/pi/RetroPie-Setup/scriptmodules/packages.sh
sudo ./home/pi/RetroPie-Setup/scriptmodules/admin/setup.sh

setup_env
rp_registerAllModules

function printMsgs() {
    local type="$1"
    shift
    for msg in "$@"; do
        [[ "$type" == "dialog" ]] && echo "$msg"
        [[ "$type" == "console" ]] && echo "$msg"
        [[ "$type" == "heading" ]] && echo -e "\n= = = = = = = = = = = = = = = = = = = = =\n$msg\n= = = = = = = = = = = = = = = = = = = = =\n"
    done
}

sudo binaries_setup

exit
