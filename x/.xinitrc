#!/bin/sh

dunst &
feh --bg-fill Pictures/wallpaper.jpg &
nm-applet &
xsetroot -cursor_name left_ptr &
pcmanfm -d &
setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr
picom --config /dev/null --backend glx --vsync -b
xinput set-prop "Logitech G403 HERO Gaming Mouse" "libinput Accel Profile Enabled" 0 1 &
(sleep 1; volumeicon) &
blueman-applet &
setxkbmap -option caps:escape
xss-lock --transfer-sleep-lock -- ~/.local/bin/lock &
exec i3
