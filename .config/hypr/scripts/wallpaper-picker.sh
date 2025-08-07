#!/bin/bash

# Configuration
WALLPAPER_DIR="$HOME/Wallpapers"
SWWW_CMD="swww img"
WALLUST_CMD="wallust run"

# Get a list of image files in the directory
images=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -printf "%f\n"))

# Check if any images were found
if [ ${#images[@]} -eq 0 ]; then
  echo "No images found in $WALLPAPER_DIR"
  exit 1
fi

# Display the images in Wofi
choice=$(printf "%s\n" "${images[@]}" | wofi --show dmenu -p "Select Wallpaper:")

# Check if a choice was made
if [ -z "$choice" ]; then
  exit 0
fi

# Get the full path of the selected image
selected_path="$WALLPAPER_DIR/$choice"

# Set the new wallpaper using swww
$SWWW_CMD "$selected_path"

# Run wallust to change the color scheme
$WALLUST_CMD "$selected_path"
