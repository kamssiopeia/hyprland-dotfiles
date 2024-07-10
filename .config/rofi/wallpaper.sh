#!/bin/bash

rofi_theme="$HOME/.config/rofi/launcher/style"

wallpapers_dir=$HOME/Wallpapers
selected_wallpaper="$(ls $wallpapers_dir | sort | rofi -dmenu -i -p " " -theme ${rofi_theme})"
selected_wallpaper_path=$wallpapers_dir/$selected_wallpaper

if [[ $selected_wallpaper_path == "" ]]; then
    exit 1
fi

if [[ -f $selected_wallpaper_path ]]; then
    echo "$selected_wallpaper_path selected"
elif [[ -d $selected_wallpaper_path ]]; then
    echo "$selected_wallpaper_path is a directory"
    exit 1
else
    echo "$selected_wallpaper_path is not valid"
    exit 1
fi

sh $HOME/.config/hypr/scripts/wallpaper_changer.sh $selected_wallpaper_path
sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -g $selected_wallpaper_path
