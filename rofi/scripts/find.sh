#!/bin/bash

# if [ -z "$1" ]; then
#     rg --sortr accessed --glob "!Workspace" --glob "!SoftMaker" --files ~ | sed -e "s|$HOME/||"
# else
#     xdg-open "$1"
# fi

# rg --sortr accessed --glob "!Workspace" --glob "!SoftMaker" --files ~ | sed -e "s|$HOME/| |"

if [ -z "$1" ]; then
    rg --sortr accessed --glob "!Workspace" --glob "!SoftMaker" --files ~
else
    # xdg-open "$1"
    setsid xdg-open "$1" &
    exit
fi

# xdg-open "$(rg --no-messages --files ~/Music ~/Screenshots ~/Documents \
#     -g "!{*.srt,*.rar,*.txt,*.zip,*.nfo}" | rofi -threads 0 \
#     -theme-str "#window { width: 900;}" \
#     -dmenu -sort -sorting-method fzf -i -p "find")"

