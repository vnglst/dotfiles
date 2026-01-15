# Deno completions
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
    export FPATH="$HOME/.zsh/completions:$FPATH"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE=true
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)
source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR=nano

# 1Password SSH agent
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# asdf version manager
if [[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]]; then
    . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# Deno
if [[ -f "$HOME/.deno/env" ]]; then
    . "$HOME/.deno/env"
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# Initialize completions
autoload -Uz compinit
compinit

# Functions
trash() {
    mv "$@" "$HOME/.Trash"
}

# Aliases
alias ll="ls -la"
alias la="ls -A"
alias l="ls -CF"
