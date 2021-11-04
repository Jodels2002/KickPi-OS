https://partclone.org/

partclone.dd -d -s /dev/hda1 -o hda1.dd.img


mkdir ~/bin
$ wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh -P ~/bin
$ chmod +x ~/bin/pishrink.sh

### Vorhandenes RasPi-Image verkleinern:
$ sudo pishrink.sh raspberry-pi.img

### Image verkleinern und Original behalten:
$ sudo pishrink.sh raspberry-pi.img raspberry-pi_pishrink.img

