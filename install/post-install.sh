#!/bin/bash

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Load utils
source $INSTALL_DIR/utils.sh

###############################################################################
func_print "Applying after configuration" 4
###############################################################################

# To install mousemagic, uncomment the following line
#sudo cp $INSTALL_DIR/hid_magicmouse.conf /etc/modprobe.d/hid_magicmouse.conf
if [ "$DISPLAY" = "x11" ]; then
  mkdir -p ~/.cache/i3lock/current
  betterlockscreen -u /usr/share/backgrounds/archlinux/archlinux-cloud.png --blur 1.0
fi
###############################################################################

func_print "Configuration Done" 11
