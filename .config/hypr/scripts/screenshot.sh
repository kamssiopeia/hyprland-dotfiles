#!/bin/bash
grim -g "$(slurp -d -w 0)" -t jpeg -q 100 - | wl-copy -t image/jpeg && wl-paste > ~/Pictures/$(date +%Y%m%d%H%m%S)_grim.jpg
