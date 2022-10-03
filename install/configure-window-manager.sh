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
sudo cp -r $INSTALL_DIR/media/lightdm-webkit-themes/arch /usr/share/lightdm-webkit/themes/
sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=web-greeter/' /etc/lightdm/lightdm.conf
sudo sed -i 's/icon_theme:/icon_theme: None/' /etc/lightdm/web-greeter.yml
sudo sed -i 's/time_language:/time_language: ru/' /etc/lightdm/web-greeter.yml

sudo systemctl enable mpd

###############################################################################

func_print "Configuration Done" 11
