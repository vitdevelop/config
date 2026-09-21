#!/bin/bash
# Removes packages left over from the old X11/bspwm/river/polybar setup and other unused ones.
# Nothing is removed by the list-* commands, remove-* ask pacman for confirmation.
# Packages that other packages still need (e.g. xorg-xrandr for steam) are skipped automatically.
#
#   cleanup-packages.sh list-x11       what remove-x11 would remove
#   cleanup-packages.sh remove-x11     remove x11, bspwm, river, polybar and their dependencies
#   cleanup-packages.sh list-unused    what remove-unused would remove
#   cleanup-packages.sh remove-unused  remove orphans, debug packages and the unused list below
#   cleanup-packages.sh review         explicit packages that no install script mentions (print only)
#
# Run remove-x11 first, it leaves new orphans that remove-unused then picks up.

INSTALL_DIR="$(dirname "$(readlink -f "$0")")"

# X11, bspwm, river, polybar and the tools around them (wayland replacements are in install-*.sh)
X11_PACKAGES=(
bspwm sxhkd polybar          # window manager, hotkeys, bar
river-classic                # old wayland compositor
dmenu clipmenu               # rofi and cliphist replace them
feh                          # swaybg
betterlockscreen i3lock-color # swaylock
fastcompmgr picom            # compositors
lightdm lightdm-webkit2-greeter nody-greeter # greetd + regreet
xorg-server xorg-xinit xorg-xsetroot xorg-xdpyinfo xorg-xev xdo
xf86-video-intel             # X driver, not used with nvidia
arandr autorandr lxrandr     # kanshi, wdisplays
xclip                        # wl-clipboard
maim scrot                   # grim, slurp
imwheel volumeicon sxiv peek redshift ueberzug xpdf
)

# superseded or unused (evidence in the comment), orphans and debug packages are added below
UNUSED_PACKAGES=(
neofetch          # archived, fastfetch is used
pulseaudio-ctl    # key bindings use pactl
mplayer           # commented out in install-software.sh, mpv/vlc are used
lswt              # not referenced anywhere in the config
woff2-font-awesome # duplicate of otf-font-awesome/ttf-font-awesome
)

installed_only() {
    local p
    for p in "$@"; do
        pacman -Qq "$p" &>/dev/null && echo "$p"
    done
}

# drops packages that other installed packages depend on, prints the rest
resolve() {
    local list=("$@") out blocked p by keep q
    for _ in $(seq 20); do
        [ ${#list[@]} -eq 0 ] && return
        out=$(pacman -Rs -p "${list[@]}" 2>&1) && break
        blocked=$(echo "$out" | sed -n "s/.*removing \(.*\) breaks dependency '.*' required by \(.*\)/\1 \2/p")
        [ -z "$blocked" ] && { echo "$out" >&2; return 1; }
        while read -r p by; do
            echo "kept: $p (required by $by)" >&2
            keep=()
            for q in "${list[@]}"; do [ "$q" != "$p" ] && keep+=("$q"); done
            list=("${keep[@]}")
        done <<< "$blocked"
    done
    printf '%s\n' "${list[@]}"
}

x11_targets() {
    resolve $(installed_only "${X11_PACKAGES[@]}")
}

unused_targets() {
    local list=()
    list+=($(installed_only "${UNUSED_PACKAGES[@]}"))
    list+=($(pacman -Qdtq))                                # orphans
    list+=($(pacman -Qmq | grep -e '-debug$'))             # makepkg debug packages of AUR builds
    resolve $(printf '%s\n' "${list[@]}" | sort -u)
}

show() {
    local targets=("$@")
    if [ ${#targets[@]} -eq 0 ]; then
        echo "nothing to remove"
        return 1
    fi
    echo "== to remove (${#targets[@]}):"
    printf '%s\n' "${targets[@]}" | column -c "${COLUMNS:-120}"
    echo "== including dependencies that become unneeded:"
    pacman -Rs -p --print-format '%n' "${targets[@]}" | sort | column -c "${COLUMNS:-120}"
}

remove() {
    local targets=("$@")
    show "${targets[@]}" || return
    sudo pacman -Rns "${targets[@]}"
}

review() {
    # explicit packages that are not in any install script (also commented ones), base is skipped
    local skip
    skip=$(pacman -Qqg base base-devel | sort -u)
    for p in $(pacman -Qqe | grep -vxF -f <(echo "$skip")); do
        grep -qw -- "$p" "$INSTALL_DIR"/*.sh || echo "$p"
    done | while read -r p; do
        printf '%-40s %s\n' "$p" "$(pacman -Qi "$p" | sed -n 's/^Description *: //p' | cut -c1-70)"
    done
}

case "$1" in
    list-x11)      x11_targets | { mapfile -t t; show "${t[@]}"; } ;;
    remove-x11)    mapfile -t t < <(x11_targets); remove "${t[@]}" ;;
    list-unused)   unused_targets | { mapfile -t t; show "${t[@]}"; } ;;
    remove-unused) mapfile -t t < <(unused_targets); remove "${t[@]}" ;;
    review)        review ;;
    *) sed -n '2,13p' "$0"; exit 1 ;;
esac
