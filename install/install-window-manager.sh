#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of window manager software" 4
###############################################################################

packages=(
arandr
archlinux-wallpaper
bspwm
clipmenu
dmenu
feh
imagemagick
imwheel
lightdm
lxappearance
lxrandr
materia-gtk-theme
nautilus
nody-greeter
papirus-icon-theme
playerctl
python-pywal
sxhkd
volumeicon
xdo
xdotool
xorg-server
xorg-xdpyinfo
xorg-xinit
xorg-xmodmap
xorg-xrandr
xorg-xrdb
xorg-xsetroot
)

func_iterate_install "${packages[@]}"

packages=(
fastcompmgr
)
func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Enabling lightdm as display manager" 5

sudo systemctl enable lightdm.service -f

###############################################################################

func_print "Software has been installed" 11
