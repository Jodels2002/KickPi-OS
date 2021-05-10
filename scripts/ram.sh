if ! grep -q 'init-poky' /etc/fstab ; then
   sudo mkdir /media/RAM
   sudo chmod -R 777 /etc/fstab
   sudo  echo '# init-poky' >> /etc/fstab
   echo 'tmpfs /media/RAM tmpfs nodev,nosuid,size=1024M 0 0 ' >> /etc/fstab
fi
