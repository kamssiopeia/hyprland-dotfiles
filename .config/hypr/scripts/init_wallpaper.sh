#!/bin/bash
CACHED_WALLPAPER=$HOME/.cache/wallpaper_changer/wallpaper

sleep 4

if [[ -e "${HOME}/.cache/wal/colors.json" && -f "$CACHED_WALLPAPER" ]]; then
    echo "Palette found, loading recent wallpaper"

    recent_wallpaper_path=$(cat $CACHED_WALLPAPER)

    sh $HOME/.config/hypr/scripts/wallpaper_changer.sh $recent_wallpaper_path
else
    echo "Palette not found, randomizing wallpaper"

    sh $HOME/.config/hypr/scripts/wallpaper_randomizer.sh
fi
