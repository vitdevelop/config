#!/bin/bash

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Create necessary directories
# ---------------
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/go/bin
mkdir -p $HOME/.mpd/playlists
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

echo "Installing YAY"
sh $INSTALL_DIR/install-yay.sh

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
sh $INSTALL_DIR/configure-conf.sh
# ---------------

# Switch to zsh
# ---------------
env zsh
# ---------------
