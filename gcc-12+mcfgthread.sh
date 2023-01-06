#!/bin/bash
set -ex

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

rm -rf $DIR/mingw-w64*

# get 'mingw-w64-mcfgthread' 'mingw-w64-gcc'
git clone https://github.com/lhmouse/MINGW-packages.git
cd $DIR/MINGW-packages
git branch -a
git checkout -b mcfgthread-pkg
cp -rf MINGW-packages/mingw-w64-mcfgthread ../
git checkout -b master
cp -rf MINGW-packages/mingw-w64-gcc ../
cd ..
rm -rf MINGW-packages
