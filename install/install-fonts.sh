#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################

func_print "Installation of fonts software" 4

packages=(
awesome-terminal-fonts
adobe-source-sans-pro-fonts
cantarell-fonts
noto-fonts
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-hack
ttf-inconsolata
ttf-liberation
ttf-roboto
ttf-ubuntu-font-family
tamsyn-font
ttf-jetbrains-mono
ttf-font-awesome
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11

