#!/bin/bash
set -ex

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

rm -rf $DIR/mingw-w64-headers-git
rm -rf $DIR/mingw-w64-crt-git
rm -rf $DIR/mingw-w64-mcfgthread
rm -rf $DIR/mingw-w64-gcc
rm -rf $DIR/mingw-w64-gdb

git clone https://github.com/lhmouse/MINGW-packages.git
cd $DIR/MINGW-packages

git fetch orgin
#git fetch origin gcc-13:gcc-13
echo "show remote branch"
git branch -r
git checkout gcc-13
git merge origin/gcc-13
echo "show local branch"
git branch
#patch -p1 -i ../fix-mcfgthread-and-gcc.patch
cp -rf mingw-w64-headers-git ../
cp -rf mingw-w64-crt-git ../
cp -rf mingw-w64-mcfgthread ../
cp -rf mingw-w64-gcc ../
cp -rf mingw-w64-gdb ../
cd ..
rm -rf MINGW-packages
