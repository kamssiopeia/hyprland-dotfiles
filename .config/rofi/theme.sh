#!/bin/bash

rofi_theme="$HOME/.config/rofi/launcher/style"

themes_dir=$HOME/.config/wal/colorschemes/dark
selected_theme="$(ls $themes_dir | sort | rofi -dmenu -i -p " " -theme ${rofi_theme})"
selected_theme_path=$themes_dir/$selected_theme

if [[ $selected_theme_path == "" ]]; then
    exit 1
fi

if [[ -f $selected_theme_path ]]; then
    echo "$selected_theme_path selected"
elif [[ -d $selected_theme_path ]]; then
    echo "$selected_theme_path is a directory"
    exit 1
else
    echo "$selected_theme_path is not valid"
    exit 1
fi

sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -t $selected_theme_path
