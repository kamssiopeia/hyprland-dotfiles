#!/bin/bash
grim -g "$(slurp -d -w 0)" -t jpeg -q 100 - | wl-copy
