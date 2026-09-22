#!/bin/bash

choices="vim\nideavim\nzsh\nhyprland\nwaybar\nvifm\ntmux\nalacritty\nrofi\ndunst"

chosen=$(echo -e "$choices" | rofi -dmenu -i -p 'Edit Config')

case "$chosen" in
    vim) alacritty -e nvim -- $HOME/.config/nvim/init.vim ;;
    ideavim) alacritty -e nvim -- $HOME/.config/idea/ideavimrc ;;
    zsh) alacritty -e nvim -- $HOME/.config/zsh/zshrc ;;
    hyprland) alacritty -e nvim -- $HOME/.config/hypr/hyprland.lua ;;
    waybar) alacritty -e nvim -- $HOME/.config/waybar/config.jsonc ;;
    vifm) alacritty -e nvim -- $HOME/.config/vifm/vifmrc ;;
    tmux) alacritty -e nvim -- $HOME/.config/tmux/tmux.conf ;;
    alacritty) alacritty -e nvim -- $HOME/.config/alacritty/alacritty.toml ;;
    rofi) alacritty -e nvim -- $HOME/.config/rofi/config.rasi ;;
    dunst) alacritty -e nvim -- $HOME/.config/dunst/dunstrc ;;
esac
