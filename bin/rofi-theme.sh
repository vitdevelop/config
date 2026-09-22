#!/bin/bash

choices="default\nlight\ndark"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p 'Select Theme')

case "$chosen" in
    default) gsettings set org.gnome.desktop.interface color-scheme default ;;
    light) gsettings set org.gnome.desktop.interface color-scheme prefer-light ;;
    dark) gsettings set org.gnome.desktop.interface color-scheme prefer-dark ;;
esac
