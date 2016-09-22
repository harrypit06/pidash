#!/bin/bash
cd /usr/src
git clone git://git.videolan.org/x264
cd x264
./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
make -j4
make -j4 install

cd /usr/src
git clone https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg/
./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree --enable-libfreetype --enable-filter=drawtext
make -j4
make -j4 install