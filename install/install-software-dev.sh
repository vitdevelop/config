#!/bin/bash
#set -e

# Load utils
source ./utils.sh

###############################################################################
func_print "Installation of development software" 4
###############################################################################

packages=(
base-devel
git
ack
ripgrep
k9s
go
go-tools
nodejs
npm
ansible
helm
vagrant
jdk-openjdk
visualvm
maven
gradle
docker
python-pip
virtualbox-host-modules-arch
virtualbox
terraform
aws-cli
kubectl
jq
highlight
httpie
s3cmd
postgresql-client
pygmentize
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Enabling services" 5

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER

###############################################################################

func_print "Software has been installed" 11

