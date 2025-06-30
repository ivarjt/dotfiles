#!/bin/bash

# Dotfiles to stow — comment out what you don't want active right now
STOW_FOLDERS=(
  "alacritty"
  "ghostty"
  "hypr"
  "hyprlock"
  "hyprmocha"
  "hyprpaper"
  "i3"
  "kitty"
  "nvim"
  "picom"
  "polybar"
  "rofi"
  "starship"
  "tmux"
  "waybar"
  "wofi"
  "zsh"
  "git"
  "bin"
  "screenlayout"
  # "gtk"
  # "fonts"    # disabled for now
)

echo "📦 Stowing selected dotfiles..."
for folder in "${STOW_FOLDERS[@]}"; do
  if [ -d "$folder" ]; then
    echo "  ➤ $folder"
    stow "$folder"
  else
    echo "  ⚠️  Skipping missing folder: $folder"
  fi
done

echo "✅ All done!"
