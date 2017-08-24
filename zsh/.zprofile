#!/bin/sh
source ~/.zsh/environment.zsh

setxkbmap -v us -variant colemak
setxkbmap -option compose:caps

xset r rate 150 20
