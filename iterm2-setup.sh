#!/bin/bash

# iTerm2 setup script
# Configures iTerm2 to load preferences from this dotfiles repo

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
ITERM2_PREFS_DIR="$DOTFILES_DIR/iterm2"

echo "==> Setting up iTerm2..."

# Check if iTerm2 is installed
if [[ ! -d "/Applications/iTerm.app" ]]; then
    echo "iTerm2 is not installed. Install it first with: brew install --cask iterm2"
    exit 1
fi

# Quit iTerm2 if running
if pgrep -x "iTerm2" > /dev/null; then
    echo "==> Closing iTerm2..."
    osascript -e 'tell application "iTerm2" to quit' 2>/dev/null || true
    sleep 2
fi

# Tell iTerm2 to use custom preferences folder
# This makes iTerm2 load preferences from our dotfiles
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$ITERM2_PREFS_DIR"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

echo "==> iTerm2 configured to load preferences from: $ITERM2_PREFS_DIR"
echo ""
echo "Note: Launch iTerm2 to apply the settings."
echo "To save future changes back to dotfiles, enable:"
echo "  iTerm2 > Settings > General > Preferences > Save changes to folder when iTerm2 quits"
