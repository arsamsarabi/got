#!/bin/sh

clear

gum spin -s points --title '💾 Installing got on your system'  -- sleep 1

rm -rf ~/.got
mkdir ~/.got
cp -a  ./app/. ~/.got
chmod +x ~/.got/got.sh
