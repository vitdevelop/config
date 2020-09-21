#!/bin/bash
#
# Configuration
# ---------------

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Load utils
source $INSTALL_DIR/utils.sh

###############################################################################
func_print "Applying system configuration" 4
###############################################################################

sudo sed -i 's|#GRUB_THEME=".*"|GRUB_THEME="/boot/grub/themes/arch-silence/theme.txt"|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

###############################################################################

func_print "Configuration Done" 11

