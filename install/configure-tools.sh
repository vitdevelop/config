#!/bin/bash
#
# Configuration
# ---------------

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# Load utils
source $INSTALL_DIR/utils.sh

###############################################################################
func_print "Applying tools configuration" 4
###############################################################################

# Install fontpreview
git clone https://github.com/sdushantha/fontpreview /tmp/fontpreview
cd /tmp/fontpreview
sudo make install

# Install epub thumbnailer
pip install Pillow
git clone https://github.com/marianosimone/epub-thumbnailer /tmp/epub-thumbnailer
cd /tmp/epub-thumbnailer
sudo python install.py install

# Install vifming
git clone https://github.com/cirala/vifmimg /tmp/vifmimg
cd /tmp/vifmimg
cp vifmimg $HOME/.local/bin
cp vifmrun $HOME/.local/bin

# Add some helm repository
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add elastic https://helm.elastic.co
helm repo add jenkinsci https://charts.jenkins.io
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add openebs https://openebs.github.io/charts
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Install istio
curl -L https://istio.io/downloadIstio | sh -
mv istio* $HOME/.local/istio
cp $HOME/.local/istio/bin/istioctl $HOME/.local/bin


###############################################################################

func_print "Configuration Done" 11


