#!/bin/bash

func_print() {
    local msg=$1
    local color_code=$2
    tput setaf $color_code;
    echo "################################################################"
    echo $msg
    echo "################################################################"
    echo;tput sgr0
}

func_install() {
	if pacman -Qi $1 &> /dev/null; then
        func_print "The package '"$1"' is already installed" 2
	else
        func_print "Installing package '"$1"'" 3
    	sudo pacman -S --noconfirm --needed $1 
    fi
}

func_install_aur() {
	if yay -Qi $1 &> /dev/null; then
        func_print "The package '"$1"' is already installed" 2
	else
        func_print "Installing package '"$1"'" 3
    	yay -S --noconfirm $1 
    fi
}

# builds and installs a local PKGBUILD directory with makepkg, AUR dependencies must be installed
# before. It builds a copy, so src/ and pkg/ don't end up in the config repo (and yay -B must not be
# used here, it runs git reset --hard in the repo that contains the directory)
func_install_aur_dir() {
    func_print "Installing PKGBUILD '"$1"'" 3
    local tmp=$(mktemp -d)
    cp -r $1/. $tmp/
    (cd $tmp && makepkg -si --noconfirm)
    rm -rf $tmp
}

func_iterate_install() {
    count=0
    local list=("$@")
    for name in "${list[@]}" ; do
        count=$[count+1]
        tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
        func_install $name
    done
}

func_iterate_install_aur() {
    count=0
    local list=("$@")
    for name in "${list[@]}" ; do
        count=$[count+1]
        tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
        func_install_aur $name
    done
}
