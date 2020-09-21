#!/bin/bash

chosen=$(clipmenu | dmenu  -l 20 -fn 'JetBrains Mono:Regular:size=14' -p 'Clipboard' -i)

echo "$chosen" | xclip -selection clipboard

