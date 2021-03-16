sudo apt install -y autoconf automake build-essential byacc dos2unix flex libavcodec-dev libavformat-dev libgtk2.0-cil-dev libgtkglext1-dev libmp3lame-dev libmpg123-dev libpcap-dev libpulse-dev libreadline-dev libswscale-dev libvte-dev libxaw7-dev subversion yasm libgtk3.0-cil-dev xa65 libsdl2-dev libsdl2-image-dev libgtk-3-dev libglew-dev

mkdir -p src

cd src

svn checkout https://svn.code.sf.net/p/vice-emu/code/trunk trunk

cd trunk/vice

./autogen.sh

./configure --disable-pdf-docs --without-pulse

make -j4

sudo make install
