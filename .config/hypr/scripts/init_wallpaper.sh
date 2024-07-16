#!/bin/bash

sleep 4

if [ -e "${HOME}/.cache/wal/colors.json" ]; then
    echo "Palette found, loading recent wallpaper"

    recent_wallpaper_path=$(cat $HOME/.cache/wal/wal)

    hyprctl hyprpaper preload "$recent_wallpaper_path"
    hyprctl hyprpaper wallpaper ",$recent_wallpaper_path"
else
    echo "Palette not found, randomizing wallpaper"

    sh $HOME/.config/hypr/scripts/wallpaper_randomizer.sh
fi
