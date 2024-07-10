#!/bin/bash

wallpaper_path=$1

if [ -z "$1" ]; then
    echo "No wallpaper path provided"
    exit 1
fi

if ! test -f $wallpaper_path; then
    echo "File does not exist"
    exit 1
fi

case $(file -b $wallpaper_path | awk '{print $1}') in
  'JPEG'*) ;;
  'PNG'*) ;;
  *)
    echo "File is not JPEG or PNG"
    exit 1
    ;;
esac

hyprctl hyprpaper preload "$wallpaper_path"
hyprctl hyprpaper wallpaper ",$wallpaper_path"
echo "Changed wallpaper"

wal -n -s -i "$wallpaper_path"
echo "Generated color palette"

killall -SIGUSR2 waybar
echo "Reloaded waybar"
