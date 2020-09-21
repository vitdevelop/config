#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of bluetooth software" 4
###############################################################################

packages=(
pulseaudio-bluetooth
bluez
bluez-libs
bluez-utils
blueberry
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Enabling services" 5

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

func_print "Software has been installed" 11

