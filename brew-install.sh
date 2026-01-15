#!/bin/bash

# Homebrew setup script for new MacBooks
# Run this script to install all packages

set -e

echo "==> Starting Homebrew setup..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "==> Homebrew already installed"
fi

echo "==> Updating Homebrew..."
brew update

# Formulae (command-line tools)
FORMULAE=(
    asdf
    cmake
    colima
    coreutils
    curl
    deno
    difftastic
    docker
    docker-buildx
    docker-compose
    elixir
    ffmpeg
    gh
    git-filter-repo
    git-lfs
    go
    htop
    jq
    localai
    micro
    mosh
    nmap
    node
    ollama
    pipenv
    pkgconf
    poetry
    postgresql@16
    python@3.12
    ruby
    uv
    wget
    yarn
)

# Casks (GUI applications)
CASKS=(
    1password
    1password-cli
    brave-browser
    cap
    claude
    iterm2
    keepingyouawake
    macwhisper
    nightfall
    obsidian
    protonvpn
    rectangle
    spotify
    tailscale
    transmission
    visual-studio-code
    vlc
    whatsapp
)

echo "==> Installing formulae..."
for formula in "${FORMULAE[@]}"; do
    if brew list --formula "$formula" &> /dev/null; then
        echo "  $formula already installed"
    else
        echo "  Installing $formula..."
        brew install "$formula"
    fi
done

echo "==> Installing casks..."
for cask in "${CASKS[@]}"; do
    if brew list --cask "$cask" &> /dev/null; then
        echo "  $cask already installed"
    else
        echo "  Installing $cask..."
        brew install --cask "$cask"
    fi
done

echo "==> Cleaning up..."
brew cleanup

echo "==> Homebrew setup complete!"
