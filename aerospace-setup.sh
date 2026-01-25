#!/bin/bash

# AeroSpace setup script

echo "Setting up AeroSpace..."

# Create config directory
mkdir -p ~/.config/aerospace

# Copy config
cp -f aerospace/aerospace.toml ~/.config/aerospace/

echo "✓ AeroSpace config installed"
echo "Make sure to:"
echo "1. Install AeroSpace: brew install --cask nikitabobko/tap/aerospace"
echo "2. Open AeroSpace.app from Finder to grant accessibility permissions"
echo "3. Reload config: aerospace reload-config"
