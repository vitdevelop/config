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

# LightDM Theme
sudo cp -r $INSTALL_DIR/media/lightdm-webkit-themes/arch /usr/share/lightdm-webkit/themes/
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
sudo sed -i 's|webkit_theme.*|webkit_theme\t    = arch|' /etc/lightdm/lightdm-webkit2-greeter.conf

sudo systemctl enable mpd

###############################################################################

func_print "Configuration Done" 11
