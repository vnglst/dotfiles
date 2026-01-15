#!/bin/bash

# Git configuration setup script
# Symlinks .gitconfig to home directory

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
GITCONFIG_SOURCE="$DOTFILES_DIR/.gitconfig"
GITCONFIG_TARGET="$HOME/.gitconfig"

echo "==> Setting up Git configuration..."

# Backup existing .gitconfig if it exists and is not a symlink
if [[ -f "$GITCONFIG_TARGET" && ! -L "$GITCONFIG_TARGET" ]]; then
    echo "==> Backing up existing .gitconfig to .gitconfig.backup"
    mv "$GITCONFIG_TARGET" "$GITCONFIG_TARGET.backup"
fi

# Remove existing symlink if present
if [[ -L "$GITCONFIG_TARGET" ]]; then
    rm "$GITCONFIG_TARGET"
fi

# Create symlink
ln -s "$GITCONFIG_SOURCE" "$GITCONFIG_TARGET"
echo "==> Symlinked $GITCONFIG_SOURCE -> $GITCONFIG_TARGET"

# Install difftastic if not present (for diff.external)
if ! command -v difft &> /dev/null; then
    echo "==> difftastic not found. Install with: brew install difftastic"
fi

echo "==> Git setup complete!"
echo ""
echo "Note: GPG signing is configured to use 1Password."
echo "Make sure 1Password is installed and SSH agent is enabled."
