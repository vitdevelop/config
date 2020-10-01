#!/bin/bash
#set -e

# Load utils
source ./../utils.sh

###############################################################################

func_print "Installing Macbook Dependencies"

# Archlinux
packages=(
    xf86-video-fbdev
    powertop
)

func_iterate_install "${packages[@]}"

# Archlinux User Repository
packages=(
kbdlight
light-git
bcwc-pcie-git
)
func_iterate_install_aur "${packages[@]}"

systemctl enable --now NetworkManager

sudo cp -f ./powertop.service /etc/systemd/system/powertop.service
systemctl enable --now powertop.service

###############################################################################

func_print "Macbook dependencies has been installed"
