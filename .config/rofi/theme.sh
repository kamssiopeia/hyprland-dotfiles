#!/bin/bash

ROFI_THEME=$HOME/.config/rofi/theme/style
THEMES_DIR=$HOME/.config/wal/colorschemes
CURR_WALL_ENTRY=" Use current wallpaper theme"

themes=$CURR_WALL_ENTRY$'\n'
themes+=$(find $THEMES_DIR -type f,l -name '*.json' -printf "%P\n" | sort)

selected_theme=$(echo "$themes" | rofi -dmenu -i -p " " -theme ${ROFI_THEME})

if [[ $selected_theme == "" ]]; then
    exit 1
elif [[ $selected_theme == $CURR_WALL_ENTRY ]]; then
    wallpaper_path=$(cat $HOME/.cache/wal/wal)
    sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -g $wallpaper_path
else
    sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -t $THEMES_DIR/$selected_theme
fi
