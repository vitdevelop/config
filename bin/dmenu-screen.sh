#!/bin/bash

font="Symbols Nerd Font:Regular:size=14"
parent=" Screen"

function restart_bspwm() {
  bspc wm -r
}

# pass 1) menu, 2) parent name
function echo_menu() {
  menu=$1
  parent=$2
  echo -e "$menu" | dmenu -fn "$font" -p "$parent" -i
}

# pass 1) parent function
function extend() {
  menu=" Left\n Right\n Top\n Down\n󰆏 Duplicate\n Back"
  local chosen=$(echo_menu "$menu" "$parent")

  case "$chosen" in
    *Left) xrandr --output HDMI1 --left-of eDP1; restart_bspwm ;;
      *Right) xrandr --output HDMI1 --right-of eDP1; restart_bspwm ;;
      *Top) xrandr --output HDMI1 --above eDP1; restart_bspwm ;;
      *Down) xrandr --output HDMI1 --below eDP1; restart_bspwm ;;
      *Duplicate) xrandr --output HDMI1 --same-as eDP1; restart_bspwm ;;
      *Back) $($1);;
  esac

}

function main_menu() {
  menu=" Refresh\n Extend"
  local chosen=$(echo_menu "$menu" "$parent")

  case "$chosen" in
      *Refresh) xrandr --auto; restart_bspwm ;;
      *Extend) $(extend main_menu) ;;
  esac
}

main_menu
