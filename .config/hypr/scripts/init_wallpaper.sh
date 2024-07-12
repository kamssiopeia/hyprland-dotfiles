#!/bin/bash

sleep 4

if [ -e "${HOME}/.cache/wal/colors.json" ]; then
    recent_wallpaper_path=$(cat $HOME/.cache/wal/colors.json | jq -r '.wallpaper')

    hyprctl hyprpaper preload "$recent_wallpaper_path"
    hyprctl hyprpaper wallpaper ",$recent_wallpaper_path"

    echo "Palette found, loaded recent wallpaper"
else
    sh $HOME/.config/hypr/scripts/wallpaper_randomizer.sh

    echo "Palette not found, randomized wallpaper"
fi
