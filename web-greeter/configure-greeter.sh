#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

pacman -S accountsservice

cp web-greeter.yml /etc/lightdm/web-greeter.yml

cp l.png /var/lib/AccountsService/icons/vitdevelop.png

cp vitdevelop /var/lib/AccountsService/users/vitdevelop
