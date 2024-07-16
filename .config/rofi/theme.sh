#!/bin/bash

rofi_theme=$HOME/.config/rofi/theme/style
themes_dir=$HOME/.config/wal/colorschemes

themes=$'Use current wallpaper theme\n'
themes+=$(find $themes_dir -type f,l -name '*.json' -printf "%P\n" | sort)

selected_theme=$(echo "$themes" | rofi -dmenu -i -p " " -theme ${rofi_theme})

if [[ $selected_theme == "" ]]; then
    exit 1
elif [[ $selected_theme == "Use current wallpaper theme" ]]; then
    wallpaper_path=$(cat $HOME/.cache/wal/wal)
    sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -g $wallpaper_path
    exit 1
fi

sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -t $themes_dir/$selected_theme
