#!/bin/sh

PREVIEWDIR=preview

# remove old media
find ./preview \
    -type f \
    -not -path '*/\.*' \
    | while read f ; do
        of=$(echo "$f" | sed -e 's/^\.\/preview/./')
        [ ! -f "$of" ] && rm "$f"
    done

# delete empty dirs
find ./preview -empty -type d -delete

# convert media
find . \
    -type f \
    -not -path "./$PREVIEWDIR/*" \
    \( \
        -iname "*.jpg" \
        -o -iname "*.jpeg" \
        -o -iname "*.png" \
        -o -iname "*.mp4" \
        -o -iname "*.avi" \
    \) \
    -exec test ! -f "preview/{}" \; \
    -exec make "preview/{}" \;
