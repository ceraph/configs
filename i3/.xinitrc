#!/usr/bin/zsh
source ~/.zsh/environment.zsh

setxkbmap -option ctrl:swapcaps
setxkbmap -option compose:lctrl

xset r rate 150 20
xset s off # turn off monitor blanking out
xset m 3 2 # Mouse speed
xset -dpms # turn off autosuspend etc.
xset -b # turn off beep

xrdb ~/.Xresources &

xrandr --output eDP1 --primary
xcalib ~/lg_27ud68_user.icm

exec i3
