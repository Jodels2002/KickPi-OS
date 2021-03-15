#Install Vulkan on a Raspberry Pi 4 64bit
sudo apt-get install libxcb-randr0-dev libxrandr-dev
sudo apt-get install libxcb-xinerama0-dev libxinerama-dev libxcursor-dev
sudo apt-get install libxcb-cursor-dev libxkbcommon-dev xutils-dev
sudo apt-get install -y xutils-dev libpthread-stubs0-dev libpciaccess-dev
sudo apt-get install -y libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev
sudo apt-get install -y bison flex libssl-dev libgnutls28-dev x11proto-dri2-dev
sudo apt-get install -y x11proto-dri3-dev libx11-dev libxcb-glx0-dev
sudo apt-get install -y libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev
sudo apt-get install -y libva-dev x11proto-randr-dev x11proto-present-dev
sudo apt-get install -y libclc-dev libelf-dev git build-essential mesa-utils
sudo apt-get install -y libvulkan-dev ninja-build libvulkan1 python-mako
sudo apt-get install -y libdrm-dev libxshmfence-dev libxxf86vm-dev libunwind-dev
sudo apt-get install -y valgrind libzstd-dev vulkan-tools vulkan-utils
sudo apt-get install -y ninja-build

sudo rm -rf /home/pi/mesa_vulkan
# install meson
sudo apt purge meson -y
sudo pip3 install meson
# install mako
sudo pip3 install mako
# install v3dv
cd ~
git clone https://gitlab.freedesktop.org/mesa/mesa.git mesa_vulkan
# build v3dv (± 30 min)
cd mesa_vulkan
CFLAGS="-mcpu=cortex-a72" \
CXXFLAGS="-mcpu=cortex-a72" \
meson --prefix /usr \
-D platforms=x11 \
-D vulkan-drivers=broadcom \
-D dri-drivers= \
-D gallium-drivers=kmsro,v3d,vc4 \
-D buildtype=release build
ninja -C build -j4
 sudo ninja -C build install
# check your driver
glxinfo -B
