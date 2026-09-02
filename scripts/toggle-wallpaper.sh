#!/bin/bash

# Read the current system appearance
mode=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

if [ "$mode" == "Dark" ]; then
  wallpaper="$HOME/.dotfiles/assets/wallpapers/dark.jpg"
else
  wallpaper="$HOME/.dotfiles/assets/wallpapers/light.png"
fi

osascript -e "tell application \"System Events\" to set picture of every desktop to \"$wallpaper\""
