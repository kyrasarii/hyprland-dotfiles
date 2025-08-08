#!/bin/bash

# Configuration
WALLPAPER_DIR="$HOME/Wallpapers"
SWWW_CMD="swww img"
WALLUST_CMD="wallust run"
CURRENT_WALLPAPER_FILE="$HOME/.config/hypr/current-wallpaper"

# Get a list of image files in the directory
images=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -printf "%f\n"))

# Check if any images were found
if [ ${#images[@]} -eq 0 ]; then
  echo "Error: No images found in $WALLPAPER_DIR" >&2
  exit 1
fi

# --- START: Randomized Selection Logic ---
# Get the total number of images found
num_images=${#images[@]}

# Generate a random index
# Using "$(( RANDOM % num_images ))" generates a random number between 0 and num_images-1
random_index=$((RANDOM % num_images))

# Get the randomly selected image filename
random_choice="${images[$random_index]}"

# Get the full path of the randomly selected image
selected_path="$WALLPAPER_DIR/$random_choice"
# --- END: Randomized Selection Logic ---

# Set the new wallpaper using swww with a cool transition effect
# You can change 'grow' to other types like 'wipe', 'outer', 'random', 'wave', 'left', 'right', 'top', 'bottom', 'center', 'any'
# The --transition-duration option sets how long the animation takes in seconds (e.g., 2 for 2 seconds)
# The --transition-fps sets the frames per second of the transition
# The --transition-step sets the step size for some transitions (larger values mean coarser, faster transitions)
$SWWW_CMD "$selected_path" --transition-type grow --transition-duration 2 --transition-fps 60

# Run wallust to change the color scheme based on the new wallpaper
$WALLUST_CMD "$selected_path"

# Save the path of the selected wallpaper to a file for Hyprlock to read
echo "$selected_path" >"$CURRENT_WALLPAPER_FILE"

echo "Wallpaper changed to: $selected_path with a 'grow' effect."
