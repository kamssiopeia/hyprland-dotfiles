#!/bin/bash

if (( $# == 0 )); then
    echo "Use either -g flag to generate palette from wallpaper path or -t to generate palette from theme"
    exit 1
fi

while getopts g:t: flag
do
    case "${flag}" in
        g) wal -n -s -i ${OPTARG};;
        t) wal -n -s --theme ${OPTARG};;
    esac
done
echo "Generated color palette"

killall -SIGUSR2 waybar
echo "Reloaded waybar"