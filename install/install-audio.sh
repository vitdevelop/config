#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of sound software" 4
###############################################################################

packages=(
pulseaudio
libpulse
pulseaudio-alsa
pavucontrol
alsa-firmware
alsa-lib
alsa-plugins
alsa-utils
gstreamer
gst-plugins-good
gst-plugins-bad
gst-plugins-base
gst-plugins-ugly
playerctl
volumeicon
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11

