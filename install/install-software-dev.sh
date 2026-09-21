#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of development software" 4
###############################################################################

packages=(
# ack
base-devel
docker
docker-buildx
docker-compose
git
go
go-tools
golangci-lint
helm
highlight
# httpie
jdk-openjdk
jq
k9s
kind
kubectl
maven
npm
nodejs
python-pygments
python-pip
# ripgrep
rustup
# s3cmd
virtualbox
virtualbox-host-dkms
)

func_iterate_install "${packages[@]}"

packages=(
vagrant
)

func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Enabling services" 5

sudo systemctl enable --now docker.service
# sudo systemctl start docker.service
sudo usermod -aG docker $USER

###############################################################################

func_print "Software has been installed" 11

