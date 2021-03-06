#!/bin/sh
# https://github.com/hoaxdream
# author: hoaxdream

aurhelper() {
    cd /tmp/
    curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
    tar xvzf yay.tar.gz
    cd  yay
    makepkg -sci --noconfirm
}

# arch packages installation
installpackages() {
    # xorg
    pkgs="xorg-server xorg-xwininfo xorg-xprop xorg-xdpyinfo"
    pkgs="$pkgs xorg-xset xorg-xsetroot xorg-xinit xterm"
    # nvidia
    pkgs="$pkgs lib32-nvidia-utils"
    pkgs="$pkgs vulkan-icd-loader lib32-vulkan-icd-loader"
    # core
    pkgs="$pkgs xcape mlocate man-db wget zip unzip unrar dosfstools ntfs-3g"
    pkgs="$pkgs xdg-user-dirs xclip xdo xdotool mediainfo bc tree"
    # audio
    pkgs="$pkgs pulseaudio-alsa pulsemixer pamixer"
    # fonts
    pkgs="$pkgs ttf-joypixels ttf-dejavu ttf-nerd-fonts-symbols ttf-roboto-mono"
    pkgs="$pkgs noto-fonts noto-fonts-emoji ttf-liberation"
    # others
    pkgs="$pkgs yt-dlp ffmpeg maim sxiv xwallpaper imagemagick"
    pkgs="$pkgs newsboat picom mpd mpc mpv ncmpcpp"
    pkgs="$pkgs zathura zathura-pdf-mupdf poppler python-adblock cronie"
    pkgs="$pkgs dunst libnotify gucharmap htop discord signal-desktop"
    pkgs="$pkgs qutebrowser qrencode steam transmission-cli"
    # mail
    pkgs="$pkgs neomutt notmuch isync msmtp"
    # lib32's needed for lutris
    pkgs="$pkgs wine-staging lib32-giflib lib32-libpng lib32-gnutls lib32-mpg123"
    pkgs="$pkgs lib32-openal lib32-v4l-utils lib32-libpulse lib32-libjpeg-turbo"
    pkgs="$pkgs lib32-libxcomposite lib32-libgcrypt lib32-libxinerama ocl-icd lib32-ocl-icd"
    pkgs="$pkgs lib32-libxslt lib32-libva lib32-gtk3 lib32-gst-plugins-base-libs lutris"
    daemon="cronie"
    # aur packages
    pkgs="$pkgs tremc lf-git"
    # emoji libxft-bgra
    yay --needed --noconfirm -Syu $pkgs
    yes | yay -S libxft-bgra-git
    # system daemon
    systemctl enable $daemon
}

# Arch aur helper yay
aurhelper

# Install all listed packages.
installpackages

echo '\033[0;32mPackages installation completed please run ./2_dotsetup.sh'
