setxkbmap -option ctrl:swapcaps
setxkbmap -option compose:lctrl
xset r rate 150 20
xset s off # turn off monitor blanking out
xset m 3 2 # Mouse speed
xset -dpms # turn off autosuspend etc.

xrdb ~/.Xresources &

/usr/bin/dispwin -d1 ~/T460s_WQHD_VVX14T058J02.icm

xrandr --output eDP1 --primary

exec i3
