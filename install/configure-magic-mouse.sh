#!/bin/bash


#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Configuring magic mouse" 4
###############################################################################

sudo sh -c "echo 'options hid_magicmouse scroll_acceleration=1 scroll_speed=55 emulate_3button=0' > /etc/modprobe.d/hid_magicmouse.conf"
###############################################################################

func_print "Magic mouse configured" 11
