#!/bin/bash

# Environment variables
export HOME=/home/vitdevelop
export XAUTHORITY=/home/vitdevelop/.Xauthority
export DISPLAY=:0

# Wait for monitor initialization
sleep 3

/usr/bin/xrandr --auto

bspc wm -r
