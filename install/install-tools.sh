#!/bin/bash
#set -e


# Load utils
source ./utils.sh

###############################################################################

func_print "Installing python tools" 5
#-----------------------------------------------
pip install simple_http_server
pip install mycli
# pip install pgcli
# pip install sqlline
pip install iredis

# Markdown preview in browser
pip install grip

# Markdown preview in terminal
pip install mdv

# Speed test
pip install speedtest-cli

# yaml processor
pip install yq

func_print "Installing nodejs tools" 5
#-----------------------------------------------

# Instant Markdown preview package for vim
sudo npm -g install instant-markdown-d

# Weather app
sudp npm install -g weather-cli

# Json viewer
sudp npm install -g fx

func_print "Installing binary tools" 5
#-----------------------------------------------

# Telescope is a share console tool
wget -c https://github.com/gravitational/teleconsole/releases/download/0.4.0/teleconsole-v0.4.0-linux-amd64.tar.gz -O - | sudo tar -xvz -C /usr/local/bin

###############################################################################

func_print "Software has been installed" 11

