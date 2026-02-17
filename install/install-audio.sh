#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of sound software" 4
###############################################################################

packages=(
pipewire
libpulse
pavucontrol
alsa-lib
gstreamer
gst-plugin-pipewire
gst-plugins-good
gst-plugins-bad
gst-plugins-base
gst-plugins-ugly
playerctl
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11

