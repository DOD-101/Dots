#!/bin/sh

img_path="/home/david/Images/scripts/eww/current_playing.png"

playerctl metadata | awk '/mpris:artUrl/ {print( $3) }' | xargs -I {}  curl "{}" -o "$img_path"

echo "$img_path"
