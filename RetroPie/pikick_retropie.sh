Code: Select all

#!/bin/bash

cd /home/pi/RetroPie-Setup
. /home/pi/RetroPie-Setup/retropie_packages.sh
. /home/pi/RetroPie-Setup/scriptmodules/system.sh
. /home/pi/RetroPie-Setup/scriptmodules/helpers.sh
. /home/pi/RetroPie-Setup/scriptmodules/packages.sh
. /home/pi/RetroPie-Setup/scriptmodules/admin/setup.sh

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

binaries_setup

exit
