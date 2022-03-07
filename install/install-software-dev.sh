#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of development software" 4
###############################################################################

packages=(
ack
base-devel
docker
git
go
go-tools
helm
highlight
httpie
jdk-openjdk
jq
k9s
kubectl
maven
npm
nodejs
pygmentize
python-pip
ripgrep
s3cmd
vagrant
virtualbox
virtualbox-host-modules-arch
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Enabling services" 5

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER

###############################################################################

func_print "Software has been installed" 11

