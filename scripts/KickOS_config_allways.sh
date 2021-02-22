if [ ! -f /etc/systemd/system/KickPi-OS_config_allways.service ]; then
      # First installation
      clear
      
      sudo systemctl daemon-reload
      sudo systemctl start KickPi-OS_config_allways
      sudo systemctl enable KickPi-OS_config_allways
      else 
      clear
      # Configured
      
      fi



