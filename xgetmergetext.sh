#!/bin/sh
[ $# -lt 2 ] && echo USAGE: $(basename $0) PATH_TO_PO_FILE SOURCEFILES && exit 1

pofile=$1
potfile=${1}t
poxfile=${1}x
shift 1
sourcefiles=$*

xgettext -o "${potfile}" ${sourcefiles}

if [ -e "$pofile" ]; then
	msgmerge -o "${poxfile}" "${pofile}" "${potfile}"
else
	cp "${potfile}" "${poxfile}"
fi

echo mv "${poxfile}" "${pofile}"
