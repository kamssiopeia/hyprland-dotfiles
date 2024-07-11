#!/bin/bash

rofi_theme=$HOME/.config/rofi/launcher/style
wallpapers_dir=$HOME/Wallpapers

selected_wallpaper="$(find $wallpapers_dir -type f -printf "%P\n" | sort | rofi -dmenu -i -p " " -theme ${rofi_theme})"

if [[ $selected_wallpaper == "" ]]; then
    exit 1
fi

selected_wallpaper_path=$wallpapers_dir/$selected_wallpaper

sh $HOME/.config/hypr/scripts/wallpaper_changer.sh $selected_wallpaper_path
sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -g $selected_wallpaper_path
