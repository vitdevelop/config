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

# LightDM Theme
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=nody-greeter/' /etc/lightdm/lightdm.conf
cd $INSTALL_DIR/../web-greeter
bash configure-greeter.sh
cd -

###############################################################################

xsetroot -cursor_name left_ptr

sudo systemctl enable mpd

###############################################################################

func_print "Configuration Done" 11
