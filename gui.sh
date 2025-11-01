#!/bin/bash

clear
echo -e "\e[31m"
echo "  ██╗  ██╗ █████╗ ██╗     ██╗██╗"
echo "  ██║ ██╔╝██╔══██╗██║     ██║██║"
echo "  █████╔╝ ███████║██║     ██║██║"
echo "  ██╔═██╗ ██╔══██║██║     ██║██║"
echo "  ██║  ██╗██║  ██║███████╗██║███████╗"
echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚══════╝"
echo "        🚀 Kali XFCE4 + Openbox Launcher 🚀"
echo -e "\e[0m"
sleep 2

export DISPLAY=:0
export PULSE_SERVER=tcp:127.0.0.1:4713

if ! pgrep -f "termux.x11" >/dev/null 2>&1; then
    termux-x11 &>/dev/null &
    sleep 2
fi

pkill xfwm4 >/dev/null 2>&1 || true
pkill openbox >/dev/null 2>&1 || true

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax)"
fi

echo "🚀 Kali XFCE4 başlatılıyor..."
startxfce4 &

sleep 5

pkill xfwm4 >/dev/null 2>&1 || echo "⚠️ xfwm4 zaten kapalı."
echo "🧠 Openbox devreye giriyor..."
openbox --replace &

if command -v tint2 >/dev/null 2>&1; then
    tint2 &
fi

if command -v feh >/dev/null 2>&1; then
    feh --bg-scale /usr/share/backgrounds/xfce/xfce-blue.jpg &
fi

if command -v xfce4-terminal >/dev/null 2>&1; then
    xfce4-terminal &
else
    xterm &
fi

echo ""
echo "✅ Kali XFCE4 + Openbox başlatıldı!"
echo "💡 Termux X11 ekranına geç!"