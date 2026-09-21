#!/bin/bash
#set -e

# Installs greetd + ReGreet (https://github.com/rharish101/ReGreet),
# ReGreet runs inside doors.
# Needs doors installed by install-doors.sh (/usr/bin/doors), the greeter user can't read /home.

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Load utils
source $INSTALL_DIR/utils.sh

###############################################################################
func_print "Installation of greetd and regreet" 4
###############################################################################

packages=(
greetd
greetd-regreet
imagemagick
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Configuring greetd" 5

sudo install -d /etc/greetd/doors
sudo install -m 644 $INSTALL_DIR/greetd/config.toml /etc/greetd/config.toml
sudo install -m 644 $INSTALL_DIR/greetd/regreet.toml /etc/greetd/regreet.toml
# ReGreet has no blur option, so the background is blurred beforehand (raise 15 for more blur)
magick /usr/share/backgrounds/archlinux/landscape.jpg -blur 0x15 /tmp/greeter-background.jpg
sudo install -m 644 /tmp/greeter-background.jpg /etc/greetd/background.jpg
rm /tmp/greeter-background.jpg
sudo install -m 755 $INSTALL_DIR/greetd/doorsrc /etc/greetd/doors/doorsrc
sudo install -m 644 $INSTALL_DIR/greetd/doorshkrc /etc/greetd/doors/doorshkrc

sudo systemctl enable greetd.service -f

###############################################################################

func_print "Software has been installed" 11
