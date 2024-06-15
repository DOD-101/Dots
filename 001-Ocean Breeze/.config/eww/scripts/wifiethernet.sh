#!/bin/sh

if [ -n "$(ip route | grep wlp61s0)" ]; then
    echo "wfi"
elif [ -n "$(ip route | grep enp59s0)" ]; then
    echo "ethernet"
else
    echo "none"
fi