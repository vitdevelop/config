#!/bin/bash

choices=" Lock\n Logout\n Suspend\n Reboot\n Poweroff"

chosen=$(echo -e "$choices" | dmenu -fn 'JetBrains Mono:Regular:size=14' -p ' Computer' -i)

case "$chosen" in
    *Lock) betterlockscreen -l dimblur ;;
    *Logout) bspc quit ;;
    *Suspend) systemctl suspend; betterlockscreen -l dimblur ;;
    *Reboot) reboot ;;
    *Poweroff) poweroff ;;
esac
