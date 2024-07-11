#!/bin/bash

if (( $# == 0 )); then
    echo "Use either -g flag to generate palette from wallpaper path or -t to generate palette from theme"
    exit 1
fi

while getopts g:t: flag
do
    case "${flag}" in
        g) wal -n -s --cols16 lighten -i ${OPTARG};;
        t) wal -n -s --theme ${OPTARG};;
    esac
done
echo "Generated color palette"

walogram -s -B
echo "Generated telegram palette"

killall -SIGUSR1 kitty
echo "Reloaded kitty"

killall -SIGUSR2 waybar
echo "Reloaded waybar"
