#!/bin/bash

# Termux X11 masaüstü için tam teşekküllü paket listesi
_pkgs=(bc bmon calc calcurse curl dbus desktop-file-utils elinks feh fontconfig-utils fsmon \
       geany git gtk2 gtk3 htop imagemagick jq leafpad mandoc mpc mpd mutt ncmpcpp \
       ncurses-utils neofetch netsurf obconf-qt openbox openssl-tool polybar ranger rofi \
       startup-notification termux-api thunar tigervnc vim wget xarchiver xbitmaps xcompmgr \
       xfce4-settings xfce4-terminal xmlstarlet xorg-font-util xorg-xrdb zsh \
       net-tools wireless-tools iproute2 nmap iw termux-api \
       mpv vlc viewnior feh ristretto audacious cmus)

# Paketlerin kurulumu
for pkg in "${_pkgs[@]}"; do
    echo "🔹 Kuruluyor: $pkg"
    pkg install -y "$pkg" || echo "❌ $pkg kurulamadı!"
done

echo "✅ Tüm paketler başarıyla kuruldu!"

