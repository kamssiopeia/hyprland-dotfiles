#!/bin/bash
grim -g "$(slurp -d)" -t jpeg -q 100 - | wl-copy
