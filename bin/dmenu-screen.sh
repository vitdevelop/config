#!/bin/bash

screen_script_path="/home/vitdevelop/.config/scripts/udev/auto_scale_monitors.sh"
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
    *Left) bash "$screen_script_path" left ;;
      *Right) bash "$screen_script_path" right  ;;
      *Top) bash "$screen_script_path" top  ;;
      *Down) bash "$screen_script_path" down  ;;
      *Duplicate) bash "$screen_script_path" duplicate  ;;
      *Back) $($1);;
  esac

}

function main_menu() {
  menu=" Refresh\n Extend"
  local chosen=$(echo_menu "$menu" "$parent")

  case "$chosen" in
      *Refresh) bash "$screen_script_path" refresh ;;
      *Extend) $(extend main_menu) ;;
  esac
}

main_menu
