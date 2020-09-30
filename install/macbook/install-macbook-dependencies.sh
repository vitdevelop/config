#!/bin/bash
#set -e

# Load utils
source ./../utils.sh
   
###############################################################################

func_print "Installing Macbook Dependencies"

# Archlinux
packages=(
)

func_iterate_install "${packages[@]}"

# Archlinux User Repository
packages=(
kbdlight
)
func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Macbook dependencies has been installed"
