#!/bin/bash

# SketchyBar setup script

echo "Setting up SketchyBar..."

# Create config directory
mkdir -p ~/.config/sketchybar/plugins

# Copy config and plugins
cp -f sketchybar/sketchybarrc ~/.config/sketchybar/
cp -f sketchybar/plugins/aerospace.sh ~/.config/sketchybar/plugins/

# Make executable
chmod +x ~/.config/sketchybar/sketchybarrc
chmod +x ~/.config/sketchybar/plugins/aerospace.sh

echo "✓ SketchyBar config installed"
echo "Make sure to:"
echo "1. Install SketchyBar: brew tap FelixKratz/formulae && brew install sketchybar"
echo "2. Install font: brew install --cask font-hack-nerd-font"
echo "3. Reload: sketchybar --reload"
echo "4. Hide native menu bar in System Settings → Control Center"
