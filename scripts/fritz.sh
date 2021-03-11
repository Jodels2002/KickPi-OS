
sudo apt-get update
sudo apt-get install -y libboost-all-dev build-essential git-core cmake libssl-dev libudev-dev qt5-default libqt5serialport5-dev libqt5svg5-dev
sudo apt-get install -y -t testing libgit2-dev


cd 
git clone https://github.com/fritzing/fritzing-app.git
git clone https://github.com/fritzing/fritzing-parts.git
cd fritzing-app
qmake
make
make install
./fritzing.sh
