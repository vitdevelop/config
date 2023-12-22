#!/bin/bash

choices=" Lock\n Logout\n Suspend\n󰒲 Hibernate\n Reboot\n Poweroff"
font="Symbols Nerd Font:Regular:size=14"

chosen=$(echo -e "$choices" | dmenu -fn "$font" -p ' Computer' -i)
lockscreen_command="betterlockscreen -l dimblur --show-layout"

case "$chosen" in
    *Lock) $lockscreen_command ;;
    *Logout) bspc quit ;;
    *Suspend) systemctl suspend; $lockscreen_command ;;
    *Hibernate) systemctl hibernate; $lockscreen_command ;;
    *Reboot) reboot ;;
    *Poweroff) poweroff ;;
esac
