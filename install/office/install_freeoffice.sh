#!/bin/bash

current_path=$(pwd)

version=978
cd /tmp
wget https://www.softmaker.net/down/softmaker-freeoffice-$(( version ))-amd64.tgz
tar zxf softmaker-freeoffice-$(( version ))-amd64.tgz
y | sh installfreeoffice
mv $HOME/uninstall_smfreeoffice2018 $HOME/planmaker18free $HOME/presentations18free $HOME/textmaker18free $HOME/.local/bin/

cd $current_path
