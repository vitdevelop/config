#!/bin/bash
#set -e

# Installs doors (https://github.com/dy-tea/doors) from the AUR doors-git PKGBUILD in ./doors, which
# builds the vitdevelop fork (branch all-fixes) instead of upstream.
# doors-git depends on wlroots-git (0.21), which conflicts with wlroots-nvidia (only needed by
# wl-gammactl), the script removes those first.
# The package also installs the wayland session for the display manager.

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Load utils
source $INSTALL_DIR/utils.sh

###############################################################################
func_print "Installation of doors" 4
###############################################################################

packages=(
swayidle
brightnessctl
)

func_iterate_install "${packages[@]}"

# wlroots-git conflicts with wlroots-nvidia (and wl-gammactl needs it), replace them first
old=$(pacman -Qq wl-gammactl wlroots-nvidia wlroots-nvidia-debug 2>/dev/null)
[ -n "$old" ] && sudo pacman -Rns --noconfirm $old

###############################################################################

func_print "Building doors from the fork" 5

# the package ships this file, remove the copy made by hand earlier
pacman -Qo /usr/share/wayland-sessions/doors.desktop &>/dev/null || sudo rm -f /usr/share/wayland-sessions/doors.desktop

func_install_aur wlroots-git
func_install_aur_dir $INSTALL_DIR/doors

###############################################################################

func_print "Software has been installed" 11
