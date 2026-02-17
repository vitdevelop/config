#!/bin/bash

export MAKEFLAGS="-j$(grep -c ^processor /proc/cpuinfo)"

# Ask for the password upfront
sudo -v

# Keep-alive: update existing sudo time stamp until the script exits
while true; do
  sudo -v
  sleep 60
  kill -0 "$$" || exit
done &

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Automatically export all env variables
set -a
source $INSTALL_DIR/install.env
# Turn off allexport mode
set +a

# Create necessary directories
# ---------------
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/go/bin
mkdir $HOME/Downloads
mkdir $HOME/Documents
mkdir $HOME/Workspace
mkdir $HOME/VirtualBox
mkdir $HOME/Desktop
mkdir $HOME/Screenshots
mkdir $HOME/Video
mkdir $HOME/Music
mkdir $HOME/Photos
mkdir $HOME/.trash
# ---------------

echo "Installing YAY"
sh $INSTALL_DIR/install-yay.sh

echo "Installing Window Manager"
sh $INSTALL_DIR/install-window-manager.sh

echo "Installing System"
sh $INSTALL_DIR/install-audio.sh
sh $INSTALL_DIR/install-bluetooth.sh
sh $INSTALL_DIR/install-printers.sh
sh $INSTALL_DIR/install-laptop.sh

echo "Installing Fonts"
sh $INSTALL_DIR/install-fonts.sh

echo "Installing Software"
sh $INSTALL_DIR/install-software.sh
sh $INSTALL_DIR/install-software-dev.sh

echo "Installing AUR Packages"
sh $INSTALL_DIR/install-aur-packages.sh

echo "Installing Tools"
sh $INSTALL_DIR/install-tools.sh

# Configuration
# ---------------
echo "Configuring System"
sh $INSTALL_DIR/configure-system.sh
sh $INSTALL_DIR/configure-oh-my-zsh.sh
sh $INSTALL_DIR/configure-window-manager.sh
sh $INSTALL_DIR/configure-tools.sh
sh $INSTALL_DIR/configure-conf.sh # this delete install dir
# ---------------

# Switch to zsh
# ---------------
# env zsh
# ---------------
