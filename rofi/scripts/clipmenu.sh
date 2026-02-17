#!/bin/bash

if [ -z "$1" ]; then
    clipmenu
else
    echo "$1" | xsel -i --clipboard
fi
