#!/bin/bash
grim -g "$(slurp -d)" -t jpeg -q 100 - | wl-copy -t image/jpeg && wl-paste > ~/Pictures/$(date +%Y%m%d%H%m%S)_grim.jpg
