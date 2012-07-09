#!/bin/sh
# xsession startup script

xrdb $HOME/.Xresources

# update mouse pointer
#xsetroot -cursor_name left_ptr

# set wallpaper
#display -window root $HOME/wallpaper0.jpg
#(DISPLAY=${DISPLAY}.1 display -window root $HOME/wallpaper1.jpg) &
#DISPLAY=${DISPLAY}.1 habak -hi $HOME/wallpaper1.jpg -mc 90,90,90,200 -mh 20 -mp 10,850 -mf /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS.ttf -ht "`verse`"
#habak -hi $HOME/wallpaper0.jpg -mc 90,90,90,200 -mh 20 -mp 10,850 -mf /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS.ttf -ht "`verse`"

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
