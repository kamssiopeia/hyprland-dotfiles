#!/bin/bash

rofi_theme=$HOME/.config/rofi/launcher/style
themes_dir=$HOME/.config/wal/colorschemes

selected_theme="$(find $themes_dir -type f -name '*.json' -printf "%P\n" | sort | rofi -dmenu -i -p " " -theme ${rofi_theme})"

if [[ $selected_theme == "" ]]; then
    exit 1
fi

sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -t $themes_dir/$selected_theme
