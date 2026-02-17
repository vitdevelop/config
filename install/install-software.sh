#!/bin/bash
#set -e


# Load utils
source ./utils.sh

###############################################################################

func_print "Installing software for category 'Editors'" 5

packages=(
neovim
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Installing software for category 'Graphics'" 5

packages=(
gimp
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Installing software for category 'Internet'" 5

packages=(
firefox
telegram-desktop
qbittorrent
chromium
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Installing software for category 'Multimedia'" 5

packages=(
#mplayer
#mpv
#streamlink
flameshot
#exiv2
#mp3info
#sox
#ffmpegthumbnailer
)
if [ "$DISPLAY" = "x11" ]; then
  packages+=(
    simplescreenrecorder
  )
fi

func_iterate_install "${packages[@]}"

packages=(
spotify
)
func_iterate_install_aur "${packages[@]}"

###############################################################################

func_print "Installing software for category 'Office'" 5

packages=(
evince
libreoffice-still
#evolution
#foliate
#xpdf
)

func_iterate_install "${packages[@]}"

# FreeOffice
# source ./office/install_freeoffice.sh

###############################################################################

func_print "Installing software for category 'System'" 5

packages=(
#dconf-editor
#arc-gtk-theme
#gnome-keyring
dunst
power-profiles-daemon
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Installing software for category 'Unpack'" 5

packages=(
#unace
unrar
zip
unzip
#sharutils
#uudeview
#arj
#cabextract
#file-roller
)

func_iterate_install "${packages[@]}"

###############################################################################

tput setaf 11;
echo "################################################################"
echo "Software has been installed"
echo "################################################################"
echo;tput sgr0

###############################################################################

func_print "Installing software for category 'Tools'" 5

packages=(
alacritty
#ueberzug
#tmux
zsh
#bat
fzf
vifm
tree
#w3m
wget
htop
rsync
#cronie
#gvfs
#xsel
dnsutils
nfs-utils
#iotop
iftop
#nmon
#glances
neofetch
man
#tldr
nmap
net-tools
yt-dlp
reflector
pass
#figlet
#libqalculate
scrcpy
)

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Installing software for category 'Drivers'" 5

packages=(
mesa
)
if [ "$GPU" = "nvidia" ]; then
  packages+=(
    nvidia-open
    nvidia-settings
  )
fi

if [ "$GPU" = "intel" ]; then
  packages+=(
    xf86-video-intel
  )
fi

func_iterate_install "${packages[@]}"

###############################################################################

func_print "Software has been installed" 11

