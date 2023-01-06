#!/bin/bash
set -ex

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

rm -rf $DIR/mingw-w64-mcfgthread
rm -rf $DIR/gcc-12-with-mcfgthread
rm -rf $DIR/gcc-13-with-mcfgthread
mkdir -p $DIR/gcc-12-with-mcfgthread
mkdir -p $DIR/gcc-13-with-mcfgthread

# get 'mingw-w64-mcfgthread' 'mingw-w64-gcc'
git clone https://github.com/lhmouse/MINGW-packages.git
cd $DIR/MINGW-packages
git branch -a
git checkout -b mcfgthread-pkg
cp -rf mingw-w64-mcfgthread ../
git checkout master
cp -rf mingw-w64-gcc ../gcc-12-with-mcfgthread

git checkout -b gcc-13 origin/gcc-13
cp -rf mingw-w64-gcc ../gcc-13-with-mcfgthread
cd ..
rm -rf MINGW-packages
