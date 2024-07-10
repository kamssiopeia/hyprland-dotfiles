#!/bin/bash

theme="$HOME/.config/rofi/launcher/style"

wallpapers=$HOME/Wallpapers
image="$(ls $wallpapers | sort | rofi -dmenu -i -p " " -theme ${theme})"
wallpaper=$wallpapers/$image

if [[ $image == "" ]]; then
    exit 1
fi

if [[ -f $wallpaper ]]; then
    echo "$wallpaper selected"
elif [[ -d $wallpaper ]]; then
    echo "$wallpaper is a directory"
    exit 1
else
    echo "$wallpaper is not valid"
    exit 1
fi

hyprctl hyprpaper preload "$wallpaper"
hyprctl hyprpaper wallpaper ",$wallpaper"
echo "Changed wallpaper"

wal -n -s -i "$wallpaper"
echo "Generated color palette"

killall -SIGUSR2 waybar
echo "Reloaded waybar"