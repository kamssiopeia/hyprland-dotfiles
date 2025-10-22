#!/bin/bash
SCREENSHOT_DIR=~/Pictures/
REGION=$(slurp -d -w 0 -b "#CCCCFF4D")

grim -g "$REGION" - |
  satty --filename - \
    --output-filename "$SCREENSHOT_DIR/screenshot-$(date +%Y%m%d%H%m%S).png" \
    --early-exit \
    --actions-on-enter save-to-clipboard \
    --save-after-copy \
    --copy-command 'wl-copy'