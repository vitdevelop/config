#!/bin/bash

# Environment variables used to call xrandr
export HOME=/home/vitdevelop
export XAUTHORITY=/home/vitdevelop/.Xauthority
export DISPLAY=:0

# Wait for monitor initialization
sleep 3

bash /home/vitdevelop/.config/scripts/udev/auto_scale_monitors.sh refresh
