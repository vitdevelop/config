#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of window manager software" 4
###############################################################################

packages=(
archlinux-wallpaper
gammastep
lightdm
materia-gtk-theme
nautilus
playerctl
)

if [ "$DISPLAY" = "x11" ]; then
  packages+=(
    bspwm
    sxhkd
    polybar
    clipmenu
    dmenu
    feh
    imagemagick # for betterlockscreen, feh
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
fi
if [ "$DISPLAY" = "wayland" ]; then
  packages+=(
    river
    swaybg
    waybar
    kanshi
    grim
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    swaylock
    power-profiles-daemon
    cliphist
    otf-font-awesome
    rofi
    rofi-pass
  )
fi

func_iterate_install "${packages[@]}"

packages=(
nody-greeter
)

if [ "$DISPLAY" = "x11" ]; then
  packages+=(
    betterlockscreen
    fastcompmgr
  )
fi
if [ "$DISPLAY" = "wayland" ]; then
  packages+=(
    lswt
  )
fi

func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Enabling lightdm as display manager" 5

sudo systemctl enable lightdm.service -f

###############################################################################

func_print "Software has been installed" 11
