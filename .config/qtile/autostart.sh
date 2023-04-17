#!/bin/sh
feh --bg-scale /usr/share/endeavouros/backgrounds/ghibli-japanese-walled-garden.png
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Wifi applet in bar
nm-applet & disown

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
