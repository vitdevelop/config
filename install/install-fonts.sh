#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################

func_print "Installation of fonts software" 4

packages=(
adobe-source-sans-pro-fonts
awesome-terminal-fonts
cantarell-fonts
gucharmap
noto-fonts
tamsyn-font
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-font-awesome
ttf-hack
ttf-inconsolata
ttf-jetbrains-mono
ttf-liberation
ttf-nerd-fonts-symbols
ttf-roboto
ttf-ubuntu-font-family
)

func_iterate_install "${packages[@]}"

packages=(
ttf-material-design-icons-extended
)

func_iterate_install_aur "${packages[@]}"

bash update_polybar_theme.sh

###############################################################################

func_print "Software has been installed" 11

