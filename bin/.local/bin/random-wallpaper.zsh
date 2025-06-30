#!/usr/bin/env bash

# Set wallpapers folder if not already set globally
export WAYPAPER_WALLPAPERS="$HOME/.config/backgrounds"

# Start Waypaper (starts hyprpaper internally)
waypaper &

# Wait a short moment for Waypaper to initialize
sleep 0.5

# Then set a random wallpaper
waypaper --random
