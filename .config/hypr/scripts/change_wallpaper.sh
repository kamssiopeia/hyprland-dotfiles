#!/bin/bash

WALLPAPERS_DIR=~/Wallpapers

random_wallpaper=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
hyprctl hyprpaper preload "$random_wallpaper"
hyprctl hyprpaper wallpaper ",$random_wallpaper"
wal -i "$random_wallpaper"
