#!/bin/bash
CACHE_DIR=$HOME/.cache/wallpaper_changer
wallpaper_path=$1

if [ -z "$1" ]; then
    echo "No wallpaper path provided"
    exit 1
fi

if ! test -f $wallpaper_path; then
    echo "File does not exist"
    exit 1
fi

echo "Validating wallpaper"
case $(file -b $wallpaper_path | awk '{print $1}') in
  'JPEG'*) ;;
  'PNG'*) ;;
  *)
    echo "File is not JPEG or PNG"
    exit 1
    ;;
esac

echo "Caching wallpaper path"
if [ ! -d "${CACHE_DIR}" ] ; then
    mkdir -p "${CACHE_DIR}"
fi

echo "$wallpaper_path" > $CACHE_DIR/wallpaper
echo "\$wallpaper = $wallpaper_path" > $CACHE_DIR/wallpaper-hyprland.conf

echo "Loading and setting wallpaper"
hyprctl hyprpaper preload "$wallpaper_path"
hyprctl hyprpaper wallpaper ",$wallpaper_path"
