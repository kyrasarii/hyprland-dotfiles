#!/bin/bash

# Test script for wofi with wallust colors
echo "Testing wofi with wallust colors..."

# Test wofi with our custom style
wofi --show=drun --style=~/.config/wofi/style.css &

# Wait a moment for wofi to appear
sleep 2

# Kill any running wofi processes
pkill wofi

echo "Test completed!"
