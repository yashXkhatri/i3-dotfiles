#!/bin/bash
cp -r .config ~/
cp .bashrc ~/

chmod +x ~/.config/dunst/scripts/volume.sh
chmod +x ~/.config/dunst/scripts/brightness.sh

sudo pacman -S i3 rofi picom dunst polybar alacritty pipewire pipewire-pulse pipewire-jack otf-comicshanns-nerd brightnessctl cbatticon
