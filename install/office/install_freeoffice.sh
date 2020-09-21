#!/bin/bash

current_path=$(pwd)

version=978
cd /tmp
wget https://www.softmaker.net/down/softmaker-freeoffice-$(( version ))-amd64.tgz
tar zxf softmaker-freeoffice-$(( version ))-amd64.tgz
y | sh installfreeoffice
mv $HOME/uninstall_smfreeoffice2018 $HOME/.local/bin/uninstall_smfreeoffice2018

cd $current_path
