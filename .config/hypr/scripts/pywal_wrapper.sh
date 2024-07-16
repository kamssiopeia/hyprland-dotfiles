#!/bin/bash

if (( $# == 0 )); then
    echo "Use either -g flag to generate palette from wallpaper path or -t to generate palette from theme"
    exit 1
fi

echo "Generating color palette"
while getopts g:t: flag
do
    case "${flag}" in
        g) wal -n -s --cols16 lighten --saturate 0.4 -i ${OPTARG};;
        t) wal -n -s --theme ${OPTARG};;
    esac
done

echo "Generating telegram palette"
walogram -s -B

echo "Reloading kitty"
killall -SIGUSR1 kitty

echo "Reloading waybar"
killall -SIGUSR2 waybar

echo "Reloading swaync"
swaync-client -rs
