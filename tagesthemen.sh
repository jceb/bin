FEED='http://www.tagesschau.de/export/video-podcast/tagesthemen'
OUTPUT=/tmp/tagesthemen.mp4

FEEDDATA=$( wget -nv -O - "${FEED}" )

TITLE=$( echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_title.xsl - )
DESCRIPTION=$( echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_description.xsl - )
PUBDATE=$( echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_pubdate.xsl - )
URL=$( echo "${FEEDDATA}" | xsltproc ~/bin/xsl/first_rss_item_url.xsl - )

if test -n "${URL}"
then
    echo URL: "${URL}"
    echo Title: "${TITLE}"
    echo Description: "${DESCRIPTION}"
    echo Publication date: "${PUBDATE}"
    read -p 'Do you want to view this item? [Yn]: ' answer
    case "${answer}" in
        n|N)
        exit 0
        ;;
    esac
    curl -o "${OUTPUT}" "${URL}"
    mplayer -fs "${OUTPUT}"
    rm "${OUTPUT}"
fi
