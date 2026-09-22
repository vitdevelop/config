#!/bin/bash

choices=" Lock\n Logout\n Suspend\n󰒲 Hibernate\n Reboot\n Poweroff"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p ' Computer')
lock() { swaylock -F -f -i /usr/share/backgrounds/archlinux/landscape.jpg; }

case "$chosen" in
    *Lock) lock ;;
    *Logout) command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()' ;;
    *Suspend) lock; systemctl suspend ;;
    *Hibernate) lock; systemctl hibernate ;;
    *Reboot) reboot ;;
    *Poweroff) poweroff ;;
esac
