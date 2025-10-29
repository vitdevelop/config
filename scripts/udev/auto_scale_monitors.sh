#!/bin/bash

function restart_bspwm() {
  bspc wm -r
}

if [ "$1" == "refresh" ]; then
  xrandr --auto; restart_bspwm
  exit 0
fi

# Get the primary monitor name
xrandr_current_connected=$(xrandr --current | grep -w "connected")
primary_line=$(echo "$xrandr_current_connected" | grep "primary")
primary_monitor=$(echo "$primary_line" | awk '{print $1}')

# If no primary monitor is found, exit
if [ -z "$primary_monitor" ]; then
    echo "No primary monitor detected."
    exit 1
fi

# Get the resolution of the primary monitor
primary_resolution=$(echo "$primary_line" | awk '{print $4}' | cut -d'+' -f1)
primary_width=$(echo "$primary_resolution" | cut -d'x' -f1)
primary_height=$(echo "$primary_resolution" | cut -d'x' -f2)

count_screens=$(echo "$xrandr_current_connected" | wc -l)

# without --fb argument, primary screen will freeze, it should allocate framebuffer for all screens
# --scale do it automatically, but need coefficient
# + 1 pixel reserve for polybar to show correctly workspaces order
framebuffer_size=$((primary_width * count_screens + 1))x$((primary_height * count_screens + 1))
xrandr --fb $framebuffer_size

# Scale other monitors based on the primary monitor's resolution
echo "$xrandr_current_connected" | while read line; do
   monitor=$(echo $line | awk '{print $1}')

   if [ "$primary_monitor" == "$monitor" ]; then
     continue
   fi

  case "$1" in
      *left) 
        xrandr --output $monitor --scale-from $primary_resolution --left-of $primary_monitor;
        xrandr --output $primary_monitor --pos "$primary_width"x0
        ;;
      *right) xrandr --output $monitor --scale-from $primary_resolution --right-of $primary_monitor ;;
      *top) 
        xrandr --output $monitor --scale-from $primary_resolution --above $primary_monitor 
        xrandr --output $primary_monitor --pos 0x"$primary_height"
        ;;
      *down) xrandr --output $monitor --scale-from $primary_resolution --below $primary_monitor ;;
      *duplicate) xrandr --output $monitor --scale-from $primary_resolution --same-as $primary_monitor ;;
  esac
    
done
xrandr --auto; restart_bspwm
