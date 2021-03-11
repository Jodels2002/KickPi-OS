sudo -i
apt-get update
apt-get install libboost-all-dev build-essential git-core cmake libssl-dev libudev-dev qt5-default libqt5serialport5-dev libqt5svg5-dev
apt-get install -t testing libgit2-dev


cd /usr/src/
git clone https://github.com/fritzing/fritzing-app.git
git clone https://github.com/fritzing/fritzing-parts.git
cd fritzing-app
qmake
make
make install
./fritzing.sh
