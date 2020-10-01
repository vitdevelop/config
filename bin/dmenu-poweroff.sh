#!/bin/bash

choices=" Lock\n Logout\n Suspend\n Reboot\n Poweroff"
font="Symbols Nerd Font:Regular:size=14"

chosen=$(echo -e "$choices" | dmenu -fn "$font" -p ' Computer' -i)

case "$chosen" in
    *Lock) betterlockscreen -l dimblur ;;
    *Logout) bspc quit ;;
    *Suspend) systemctl suspend; betterlockscreen -l dimblur ;;
    *Reboot) reboot ;;
    *Poweroff) poweroff ;;
esac
