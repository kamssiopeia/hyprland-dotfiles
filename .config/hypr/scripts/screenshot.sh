#!/bin/bash
mode=${1:-region} # region | fullscreen
save_to_file=${2:-false}

SCREENSHOT_DIR=~/Pictures

case "$mode" in
  region)
    region=$(slurp -d -w 0 -b "#CCCCFF4D")
    ;;
  fullscreen)
    region=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | "\(.x),\(.y) \((.width / .scale) | floor)x\((.height / .scale) | floor)"')
    ;;
esac

satty_args=(
  --filename -
  --early-exit
  --actions-on-enter save-to-clipboard
  --copy-command 'wl-copy'
)

if [[ $save_to_file == true ]]; then
  satty_args+=(
    --output-filename "$SCREENSHOT_DIR/screenshot-$(date +%Y%m%d%H%m%S).png"
    --save-after-copy
  )
fi

grim -g "$region" - |
  satty "${satty_args[@]}"
