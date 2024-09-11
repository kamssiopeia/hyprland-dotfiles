#!/bin/bash
grim -g "$(slurp -d -w 0 -b "#CCCCFF4D")" -t jpeg -q 100 - | wl-copy -t image/png
