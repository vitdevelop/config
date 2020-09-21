#!/bin/bash

chosen=$(rg --files ~/Documents ~/Screenshots ~/Downloads ~/Music ~/Photos ~/Video | sort -f | dmenu  -l 30 -fn 'JetBrains Mono:Regular:size=14' -p 'Find' -i)
xdg-open "$chosen" 2>/dev/null &
