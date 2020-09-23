#!/bin/bash
#set -e


# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of AUR software" 4
###############################################################################

packages=(
arch-silence-grub-theme-git
archlinux-wallpaper
betterlockscreen
docker-credential-pass
golangci-lint-bin
insomnia
jvmtop
kind
kops
nerd-fonts-complete
polybar
poppler
pulseaudio-ctl
pv
skypeforlinux-stable-bin
slack-desktop
sxiv-rifle
)

func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11

