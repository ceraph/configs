#!/bin/sh
source ~/.zsh/environment.zsh

setxkbmap -layout us
setxkbmap -option compose:caps

xset r rate 150 20 # Set keyboard key repeat rate.
xset s off -dpms # Prevent turning off display.
