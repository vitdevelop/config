#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of laptop software" 4
###############################################################################

packages=(
tlp
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Enabling services" 5

sudo systemctl enable tlp.service

func_print "Software has been installed" 11

