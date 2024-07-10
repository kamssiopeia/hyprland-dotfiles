#!/bin/bash

WALLPAPERS_DIR=~/Wallpapers

random_wallpaper=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
echo "Randomized wallpaper [${random_wallpaper}]"

hyprctl hyprpaper preload "$random_wallpaper"
hyprctl hyprpaper wallpaper ",$random_wallpaper"
echo "Changed wallpaper"

wal -n -s -i "$random_wallpaper"
echo "Generated color palette"

source waybar_reload.sh > /dev/null 2>&1
echo "Reloaded waybar"

