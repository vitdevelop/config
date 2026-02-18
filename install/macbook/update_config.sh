# !/bin/bash

rm -rf $HOME/.config/polybar
ln -sf $HOME/.config/install/macbook/polybar $HOME/.config/polybar

ln -sf $HOME/.config/install/macbook/xprofile $HOME/.xprofile
ln -sf $HOME/.config/install/macbook/xresources $HOME/.Xresources
ln -sf $HOME/.config/install/macbook/sxhkdrc $HOME/.config/sxhkd/sxhkdrc
ln -sf $HOME/.config/install/macbook/waybar/config.jsonc $HOME/.config/waybar/config.jsonc
ln -sf $HOME/.config/install/macbook/river/init $HOME/.config/river/init


