#!/bin/sh

clear
gum spin -s points --title '⛓️  Adding alias to ~/.bashrc' -- sleep 1
echo "alias got='~/.got/got.sh'" >> ~/.bashrc

clear
gum spin -s points --title '📖 Sourcing ~/.bashrc ...' -- sleep 1
source ~/.bashrc
