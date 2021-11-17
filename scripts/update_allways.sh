update.sh

sudo dpkg --configure -a
sudo apt -y --fix-broken install
sudo apt -f -y install
