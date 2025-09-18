#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <light|dark>"
  exit 1
fi

# Store the first argument in a variable
theme="$1"

# Convert the argument to lowercase for case-insensitive comparison
theme_lower=$(echo "$theme" | tr '[:upper:]' '[:lower:]')

# Check the value of the argument
if [ "$theme_lower" = "light" ]; then
  cp ~/.config/wezterm/wezterm.light.lua ~/.config/wezterm/wezterm.lua
  cp ~/.config/nvim/themes/light.lua ~/.config/nvim/lua/plugins/colorscheme.lua
  echo "Theme set to Light."
  # Add commands for the light theme here
elif [ "$theme_lower" = "dark" ]; then
  cp ~/.config/wezterm/wezterm.dark.lua ~/.config/wezterm/wezterm.lua
  cp ~/.config/nvim/themes/dark.lua ~/.config/nvim/lua/plugins/colorscheme.lua
  echo "Theme set to Dark."
  # Add commands for the dark theme here
else
  echo "Invalid argument: '$theme'. Please use 'light' or 'dark'."
  exit 1
fi
