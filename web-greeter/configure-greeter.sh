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

# For retina displays
#sed -i '/@media screen and (min-width: 3000px) and (min-height: 1200px) {/,/}/ {
    #s/zoom: 2;/zoom: 1.5;/;
    #/@media\|}/d;
#}' /usr/share/web-greeter/themes/gruvbox/css/style.css
sed -i '/<i class="mdi mdi-account"><\/i>/d' /usr/share/web-greeter/themes/gruvbox/index.html
