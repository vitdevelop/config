#!/bin/bash
# Screen layout menu (wlr-randr). First output is the primary one.

mapfile -t outs < <(wlr-randr | awk '/^[^ ]/ {print $1}')
main=${outs[0]}
other=${outs[1]}
headless=$(printf '%s\n' "${outs[@]}" | grep '^HEADLESS' | head -1)

desktop_icon=$''

choices=""
if [ -n "$other" ]; then
    choices="${choices} Left\n Right\n Top\n Down\n󰆏 Duplicate\n Only $main\n Only $other\n On all\n"
fi
if [ -n "$headless" ]; then
    choices="${choices}${desktop_icon} Remove virtual display"
else
    choices="${choices}${desktop_icon} Add virtual display"
fi
chosen=$(echo -e "$choices" | rofi -dmenu -i -p ' Screen')
[ -z "$chosen" ] && exit 0

# pass 1) x, 2) y of the second output, placed relative to the primary
place() {
    read -r w h < <(wlr-randr | awk -v o="$main" '$1==o {f=1} f && /current/ {split($1,a,"x"); print a[1], a[2]; exit}')
    read -r ow oh < <(wlr-randr | awk -v o="$other" '$1==o {f=1} f && /current/ {split($1,a,"x"); print a[1], a[2]; exit}')
    case "$1" in
        left)  wlr-randr --output "$main" --on --pos "$ow,0" --output "$other" --on --pos 0,0 ;;
        right) wlr-randr --output "$main" --on --pos 0,0 --output "$other" --on --pos "$w,0" ;;
        top)   wlr-randr --output "$main" --on --pos "0,$oh" --output "$other" --on --pos 0,0 ;;
        down)  wlr-randr --output "$main" --on --pos 0,0 --output "$other" --on --pos "0,$h" ;;
    esac
}

case "$chosen" in
    *Left) place left ;;
    *Right) place right ;;
    *Top) place top ;;
    *Down) place down ;;
    *Duplicate)
        pkill -x wl-mirror
        wlr-randr --output "$other" --on
        setsid wl-mirror --fullscreen-output "$other" "$main" >/dev/null 2>&1 &
        ;;
    *"Only $main") pkill -x wl-mirror; wlr-randr --output "$main" --on --output "$other" --off ;;
    *"Only $other") wlr-randr --output "$other" --on --output "$main" --off ;;
    *"On all") for o in "${outs[@]}"; do wlr-randr --output "$o" --on; done ;;
    *"Add virtual display") hyprctl output create headless ;;
    *"Remove virtual display") hyprctl output remove "$headless" ;;
esac
