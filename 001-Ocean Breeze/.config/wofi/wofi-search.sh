#!/bin/sh

term=$(wofi --show dmenu --height 50)

if [[ "$term" =~ \.+ ]]; then
	floorp --new-tab "$term"
else
	floorp --new-tab https://search.brave.com/search?q="$term"
fi
