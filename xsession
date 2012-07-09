#!/bin/sh
# xsession startup script

xrdb $HOME/.Xresources

# touchpad daemon to turn touchpad off while typing
syndaemon -d -i 1.0 -t -K &
synclient PalmDetect=1 HorizTwoFingerScroll=1 VertEdgeScroll=0

# chat programs
xchat --minimize=2 &
pidgin &
skypegtk &

# start several other programs
xbindkeys &
#workrave &
xscreensaver -no-splash &
batterymon &
pnmixer &
keepass &
# gwibber &
