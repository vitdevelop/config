#!/bin/bash
#set -e

# Load utils
source ./utils.sh

# The compositor (doors) and the login manager (greetd + regreet) are installed by install-doors.sh
# and install-greeter.sh

###############################################################################
func_print "Installation of window manager software" 4
###############################################################################

packages=(
archlinux-wallpaper
gammastep
materia-gtk-theme
nautilus
swaybg
waybar
kanshi
grim
slurp
xdg-desktop-portal
xdg-desktop-portal-wlr
swaylock
cliphist
wl-clipboard
otf-font-awesome
rofi
rofi-pass
)

func_iterate_install "${packages[@]}"

# wl-gammarelay-rs: brightness/gamma/temperature, replacement for wl-gammactl
#packages=(
#wl-gammarelay-rs
#)
#func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11
