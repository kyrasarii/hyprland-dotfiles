#!/bin/bash

# Define the directory where screenshots will be saved
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# Create the directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Define the screenshot file name with a timestamp
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
FILENAME="screenshot-$TIMESTAMP.png"

# Take a screenshot of the selected area using grim and slurp
grim -g "$(slurp)" "$SCREENSHOT_DIR/$FILENAME"

# Display a notification
notify-send "Screenshot" "Area screenshot captured and saved to $SCREENSHOT_DIR/$FILENAME"
