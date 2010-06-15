#!/bin/sh

# tagesschau
#  Download and display the latest Tagesschau
#
# Depends: xsltproc, wget, mplayer or vlc
#
# Copyright (C) 2010 Jan Christoph Ebersbach
#
# http://www.e-jc.de/
#
# All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# Binary versions of this file provided by Univention to you as
# well as other copyrighted, protected or trademarked materials like
# Logos, graphics, fonts, specific documentations and configurations,
# cryptographic keys etc. are subject to a license agreement between
# you and Univention.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

#if [ -z "$TERM" ]; then
#	x-terminal-emulator -e $0 "$@" &
#fi

FEED='http://www.tagesschau.de/export/video-podcast/tagesschau'
OUTPUT=/tmp/tagesschau.mp4

PLAYER=
if $(which vlc > /dev/null); then
	PLAYER="vlc --fullscreen"
elif $(which mplayer > /dev/null); then
	PLAYER="mplayer -fs"
else
	echo "ERROR: unable to locate vlc or mplayer." >&2
fi

FEEDDATA=$(wget -q -O - "${FEED}")

TITLE=$(echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_title.xsl -)
DESCRIPTION=$(echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_description.xsl -)
PUBDATE=$(echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_pubdate.xsl -)
URL=$(echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_url.xsl -)

if [ -n "${URL}" ]; then
	answer=
	if [ -z "$TERM" ]; then
		answer=$(zenity --question 'URL: "${URL}"\nTitle: "${TITLE}"\nPublication date: "${PUBDATE}"\nDo you want to view this item?')
	else
		echo URL: "${URL}"
		echo Title: "${TITLE}"
		echo Description: "${DESCRIPTION}"
		echo Publication date: "${PUBDATE}"
		read -p 'Do you want to view this item? [Yn]: ' answer
	fi
	case "${answer}" in
		n|N)
			exit 0
			;;
	esac
	wget -q -O "${OUTPUT}" "${URL}"
	$PLAYER "${OUTPUT}"
	rm "${OUTPUT}"
fi
