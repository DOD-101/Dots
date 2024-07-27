#!/bin/sh

TLD_PATH="${0%/*}/tlds.txt"

term=$(wofi --show dmenu --height 50)

if [[ "$term" == *"."* ]]; then
    tld="${term##*.}"
    tld="${tld%%/*}"

    echo "$tld"

    if [[ -n "$(cat "$TLD_PATH" | grep -i -w $tld)" ]]; then
        firefox --new-tab "$term"
        exit
    fi
fi

firefox --new-tab https://search.brave.com/search?q="$term"
