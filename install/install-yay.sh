#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installing AUR" 3
###############################################################################

git clone https://aur.archlinux.org/yay-git.git $HOME/yay-git
cd $HOME/yay-git
makepkg -si --noconfirm
rm -rf $HOME/yay-git

yay --editmenu --nodiffmenu --save

###############################################################################

func_print "AUR Software has been installed" 11

