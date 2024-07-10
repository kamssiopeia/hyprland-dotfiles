#!/bin/bash

WALLPAPERS_DIR=~/Wallpapers

random_wallpaper=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
echo "Randomized wallpaper [${random_wallpaper}]"

sh $HOME/.config/hypr/scripts/wallpaper_changer.sh $random_wallpaper
sh $HOME/.config/hypr/scripts/pywal_wrapper.sh -g $random_wallpaper
