#!/bin/bash

IMG_PATH=$HOME'/Screenshots'
EDIT=gimp
CLIPBOARD='xclip -selection clipboard -target image/png -i'
TIME=3000 #Miliseconds notification should remain visible

prog=" Fullscreen
 Section"

prog_args=" Capture
 Edit
 Clipboard"

cmd_prog=$(dmenu -fn 'JetBrains Mono:Regular:size=14' -p ' Screenshot' -i <<< "$prog")
cmd_args=$(dmenu -fn 'JetBrains Mono:Regular:size=14' -p ' Action' -i <<< "$prog_args")

askArgruments () {
    filename=$(date +%s).png
    case ${cmd_args} in
        *Capture)   maim $1 $filename -m 10  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen shot taken and saved'  ;;
        *Edit)      maim $1 $filename -m 10 && $EDIT $filename  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen shot edited and saved' ;;
        *Clipboard) maim $1 -m 10 | $CLIPBOARD  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen shot copied to clipboard' ;;
    esac 
}

cd $IMG_PATH
case ${cmd_prog} in
	*Fullscreen)	 
        askArgruments "-d 1" ;;
    *Section)
        askArgruments "-s" ;;
esac

