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

cmd_prog=$(rofi -dmenu -p ' Screenshot' -lines 2 -width 250 -i <<< "$prog")
cmd_args=$(rofi -dmenu -p ' Action' -lines 3 -width 250 -i <<< "$prog_args")

askArgruments () {
    case ${cmd_args} in
        *Capture) scrot $1 '%d.%m.%Y-%H:%M:%S-$wx$h.png' -q 100  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen shot taken and saved'  ;;
        *Edit) scrot $1 '%d.%m.%Y-%H:%M:%S-$wx$h.png' -q 100 -e "$EDIT \$f"  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen shot edited and saved' ;;
        *Clipboard) scrot $1 '%d.%m.%Y-%H:%M:%S-$wx$h.png' -q 100 -e "$CLIPBOARD \$f; rm -rf \$f"  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen shot copied to clipboard' ;;
    esac 
}

cd $IMG_PATH
case ${cmd_prog} in
	*Fullscreen)	 
        askArgruments "-d 1" ;;
    *Section)
        askArgruments "-s" ;;
esac

