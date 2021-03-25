cd
git clone https://github.com/popcornmix/omxplayer.git
make ffmpeg
make -j$(nproc)
sudo make install
