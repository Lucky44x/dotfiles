#!/bin/sh

# Clear the cache and lock-files
find $HOME/.cache/eww/locks -name "*.lock" -exec rm -f {} +

# Start daemon
eww daemon
