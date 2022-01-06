#!/bin/bash

mkdir -p $HOME/.local/share/fonts
cd $HOME/.local/share/fonts

git clone https://github.com/adi1090x/polybar-themes

cp -r $HOME/.local/share/fonts/polybar-themes/fonts/* .
rm -rf $HOME/.local/share/fonts/polybar-themes

cd -
