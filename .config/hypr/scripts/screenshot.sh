#!/bin/bash
save_to_file=${1:-false}

SCREENSHOT_DIR=~/Pictures
REGION=$(slurp -d -w 0 -b "#CCCCFF4D")

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

grim -g "$REGION" - |
  satty "${satty_args[@]}"
