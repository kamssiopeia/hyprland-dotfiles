#!/bin/bash

rofi_theme=$HOME/.config/rofi/theme/style
themes_dir=$HOME/.config/wal/colorschemes

curr_wall_entry=" Use current wallpaper theme"
themes=$curr_wall_entry$'\n'
themes+=$(find $themes_dir -type f,l -name '*.json' -printf "%P\n" | sort)

selected_theme=$(echo "$themes" | rofi -dmenu -i -p " " -theme ${rofi_theme})

if [[ $selected_theme == "" ]]; then
    exit 1
elif [[ $selected_theme == $curr_wall_entry ]]; then
    wallpaper_path=$(cat $HOME/.cache/wal/wal)
    sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -g $wallpaper_path
else
    sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -t $themes_dir/$selected_theme
fi
