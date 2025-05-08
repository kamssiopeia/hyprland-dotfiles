#!/bin/bash
grim -g "$(slurp -d -w 0 -b "#CCCCFF4D")" -t jpeg -q 100 ~/Pictures/$(date +%Y%m%d%H%m%S)_grim.jpg
