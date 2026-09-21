#!/bin/bash
#
# Configuration
# ---------------

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Load utils
source $INSTALL_DIR/utils.sh

###############################################################################
func_print "Applying window manager configuration" 4
###############################################################################

# Wallpaper
sudo cp $INSTALL_DIR/media/wallpapers/archlinux-cloud.png /usr/share/backgrounds/archlinux/archlinux-cloud.png
sudo cp $INSTALL_DIR/media/wallpapers/archlinux-simplyblack.png /usr/share/backgrounds/archlinux/archlinux-simplyblack.png

# Display Day/Night shift
sed -i "s/^adjustment-method=.*/adjustment-method=wayland/" $INSTALL_DIR/../gammastep/config.ini

###############################################################################

func_print "Configuration Done" 11
