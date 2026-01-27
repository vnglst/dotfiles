# Dotfiles

Personal dotfiles and macOS setup.

## Setup Scripts

Run these scripts to set up different components:

```bash
./git-setup.sh         # Git configuration
./zsh-setup.sh         # Zsh and Oh My Zsh
./iterm2-setup.sh      # iTerm2 preferences
./aerospace-setup.sh   # AeroSpace window manager
./sketchybar-setup.sh  # SketchyBar status bar
./brew-install.sh      # Homebrew packages
./macos-defaults.sh    # macOS system preferences
```

## Structure

- `aerospace/` - AeroSpace tiling window manager config
- `sketchybar/` - SketchyBar status bar config and plugins
- `iterm2/` - iTerm2 preferences
- `.gitconfig` - Git configuration
- `.zshrc` - Zsh configuration

## Quick Start

```bash
# Clone the repo
git clone https://github.com/vnglst/dotfiles.git ~/Code/dotfiles
cd ~/Code/dotfiles

# Run setup scripts
./zsh-setup.sh
./git-setup.sh
./iterm2-setup.sh
./aerospace-setup.sh
./sketchybar-setup.sh
./brew-install.sh
./macos-defaults.sh
```

## AeroSpace + SketchyBar

Keyboard-driven tiling window manager setup. See [blog post](https://koenvangilst.nl/blog/aerospace-sketchybar-macos-setup) for details.

**SketchyBar padding (windows stay below the bar):**

- AeroSpace reserves space at the top via `gaps.outer.top`. This prevents tiled windows from covering SketchyBar.
- It’s configured per-monitor in [aerospace/aerospace.toml](aerospace/aerospace.toml) (built-in uses a smaller value, external uses SketchyBar height).
- After tweaking, run `aerospace reload-config` (and `sketchybar --reload` if you changed SketchyBar).

**Workspace layout:**

1. iTerm
2. Browser
3. VSCode
4. Claude
5. Notes, Messages, Finder, Spotify

**Key shortcuts:**

- `alt+hjkl` - Navigate windows
- `alt+1-5` - Switch workspaces
- `alt+,.` - Switch monitors
- `alt+enter` - Launch iTerm
