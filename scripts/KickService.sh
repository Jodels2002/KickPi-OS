[Unit]
Description=KickOS_config_allways
Wants=network-online.target
After=network-online.target nss-lookup.target

[Service]
Type=exec
Restart=always
RestartSec=1
User=$USER
UMask=0000
ExecStart=/usr/local/bin/KickOS_config_allways.sh

[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo systemctl start KickOS_config_allways
sudo systemctl enable KickOS_config_allways
