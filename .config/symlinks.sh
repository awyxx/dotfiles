#!/bin/bash

#warning: this probably doesnt even work proplerly
#i have to to a proper install script.

#todo: check if backup already exists
# and more ...

# home/repo -> original file
#.config/x -> symlink

mkdir ~/.config/backup/
cp -r ~/.config/alacritty/ ~/.config/backup/
cp -r ~/.config/i3/ ~/.config/backup/
cp -r ~/.config/i3status/ ~/.config/backup/
cp -r ~/.config/nvim/ ~/.config/backup/

mv ~/.config/alacritty/ ./alacritty
mv ~/.config/i3/ ./i3
mv ~/.config/i3status/ ./i3status
mv ~/.config/nvim/ ./nvim

ln -s `pwd`/alacritty/ ~/.config/alacritty
ln -s `pwd`/i3/ ~/.config/i3
ln -s `pwd`/i3status/ ~/.config/i3status
ln -s `pwd`/nvim/ ~/.config/nvim

