#!/bin/bash

choices="default\nlight\ndark"

chosen=$(echo -e "$choices" | dmenu -fn 'JetBrains Mono:Regular:size=14' -p 'Select Theme' -i)

case "$chosen" in
    default) gsettings set org.gnome.desktop.interface color-scheme default ;;
    light) gsettings set org.gnome.desktop.interface color-scheme prefer-light ;;
    dark) gsettings set org.gnome.desktop.interface color-scheme prefer-dark ;;
esac
