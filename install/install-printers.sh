#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of printer software" 4
###############################################################################

packages=(
cups
cups-pdf
ghostscript
gsfonts
gutenprint
gtk3-print-backends
libcups
system-config-printer
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Enabling services" 4

sudo systemctl enable org.cups.cupsd.service

func_print "Software has been installed" 11

