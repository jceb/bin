#!/bin/sh

SETXKBMAP="setxkbmap -display $DISPLAY -model pc105"
LAYOUT="-layout"
NODK="-variant nodeadkeys"

case $2 in
    no ) eval "$SETXKBMAP $NODK $LAYOUT $1" ;;
    * ) eval "$SETXKBMAP $LAYOUT $1" ;;
esac

xmodmap /etc/X11/Xmodmap
