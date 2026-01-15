#!/bin/bash

# Zsh and Oh My Zsh setup script

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
ZSHRC_SOURCE="$DOTFILES_DIR/.zshrc"
ZSHRC_TARGET="$HOME/.zshrc"

echo "==> Setting up Zsh and Oh My Zsh..."

# Install Oh My Zsh if not installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "==> Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "==> Oh My Zsh already installed"
fi

# Install custom plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# zsh-autosuggestions
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    echo "==> Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "==> zsh-autosuggestions already installed"
fi

# zsh-syntax-highlighting
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    echo "==> Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "==> zsh-syntax-highlighting already installed"
fi

# Backup existing .zshrc if it exists and is not a symlink
if [[ -f "$ZSHRC_TARGET" && ! -L "$ZSHRC_TARGET" ]]; then
    echo "==> Backing up existing .zshrc to .zshrc.backup"
    mv "$ZSHRC_TARGET" "$ZSHRC_TARGET.backup"
fi

# Remove existing symlink if present
if [[ -L "$ZSHRC_TARGET" ]]; then
    rm "$ZSHRC_TARGET"
fi

# Create symlink
ln -s "$ZSHRC_SOURCE" "$ZSHRC_TARGET"
echo "==> Symlinked $ZSHRC_SOURCE -> $ZSHRC_TARGET"

# Create completions directory for Deno
mkdir -p "$HOME/.zsh/completions"

echo "==> Zsh setup complete!"
echo ""
echo "Note: Restart your terminal or run 'source ~/.zshrc' to apply changes."
