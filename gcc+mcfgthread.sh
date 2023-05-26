#!/bin/bash
set -ex

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

rm -rf $DIR/mingw-w64-binutils
rm -rf $DIR/mingw-w64-headers-git
rm -rf $DIR/mingw-w64-crt-git
rm -rf $DIR/mingw-w64-mcfgthread
rm -rf $DIR/mingw-w64-winpthreads-git
rm -rf $DIR/mingw-w64-libiconv
rm -rf $DIR/mingw-w64-gcc
rm -rf $DIR/mingw-w64-gdb


git clone https://github.com/lhmouse/MINGW-packages.git
cd $DIR/MINGW-packages
cp -rf mingw-w64-binutils ../
cp -rf mingw-w64-headers-git ../
cp -rf mingw-w64-crt-git ../
cp -rf mingw-w64-mcfgthread ../
cp -rf mingw-w64-winpthreads-git ../
cp -rf mingw-w64-libiconv ../
cp -rf mingw-w64-gcc ../
cp -rf mingw-w64-gdb ../
cd ..
rm -rf MINGW-packages
