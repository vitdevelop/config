#!/bin/bash
#set -e

# Load utils
source ./utils.sh

# The login manager (greetd + regreet) is installed by install-greeter.sh

###############################################################################
func_print "Installation of window manager software" 4
###############################################################################

packages=(
hyprland
archlinux-wallpaper
gammastep
materia-gtk-theme
nautilus
swaybg
kanshi wlr-randr wl-mirror wayvnc
grim
slurp
xdg-desktop-portal
xdg-desktop-portal-hyprland
swaylock
cliphist
wl-clipboard
otf-font-awesome
rofi
brightnessctl
)

func_iterate_install "${packages[@]}"

# the packaged extra/waybar (0.15.0) predates Hyprland's Lua dispatch rewrite: its
# hyprland/workspaces module sends the old "dispatch workspace N" IPC command, which the new
# hyprctl/Hyprland rejects outright, so clicking a workspace button silently does nothing.
# waybar-git (built from current upstream HEAD) has this fixed.
packages=(
waybar-git
rofi-pass
)

func_iterate_install_aur "${packages[@]}"

# wl-gammarelay-rs: brightness/gamma/temperature, replacement for wl-gammactl
#packages=(
#wl-gammarelay-rs
#)
#func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11
