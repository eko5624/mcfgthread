#!/bin/bash
set -ex

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

rm -rf $DIR/mingw-w64-headers-git
rm -rf $DIR/mingw-w64-crt-git
rm -rf $DIR/mingw-w64-mcfgthread
rm -rf $DIR/mingw-w64-gcc
rm -rf $DIR/mingw-w64-gdb
rm -rf $DIR/gcc-13-with-mcfgthread
mkdir -p $DIR/gcc-13-with-mcfgthread

# get 'mingw-w64-mcfgthread' 'mingw-w64-gcc'
git clone https://github.com/lhmouse/MINGW-packages.git
cd $DIR/MINGW-packages
cp -rf mingw-w64-headers-git ../
cp -rf mingw-w64-crt-git ../
cp -rf mingw-w64-mcfgthread ../
cp -rf mingw-w64-gcc ../
cp -rf mingw-w64-gdb ../

git fetch origin
git fetch origin gcc-13:gcc-13
git branch -a
git checkout -b gcc-13 origin/gcc-13
cp -rf mingw-w64-gcc ../gcc-13-with-mcfgthread
cd ..
rm -rf MINGW-packages
