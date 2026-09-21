#!/bin/bash
#set -e


# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of AUR software" 4
###############################################################################

packages=(
arch-silence-grub-theme-git
docker-credential-pass
downgrade
)

func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11

