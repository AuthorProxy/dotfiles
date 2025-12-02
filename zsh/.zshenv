# LOCAL HELPERS
export PROJECTS="$HOME/Projects"
export DOT_FILES="$PROJECTS/dotfiles"
export NERDY_HOME="$PROJECTS/nerdybunny"

# XDG Base Directory Specification (https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
export XDG_HOME_DIR="$HOME"
export ZPFX="$XDG_HOME_DIR/.local"
export XDG_CACHE_HOME="$XDG_HOME_DIR/.cache"
export XDG_CONFIG_HOME="$XDG_HOME_DIR/.config"
export XDG_DATA_HOME="$ZPFX/share"
export XDG_STATE_HOME="$ZPFX/state"
export XDG_BIN_HOME="$ZPFX/bin"

# Home for tools
export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
export EZA_CONFIG_DIR=$XDG_CONFIG_HOME/eza
export LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit/catppuccin-frappe.yml"

# GoLang
export PATH=$HOME/go/bin:$PATH

# Android Studio
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools

# Added by LM Studio CLI (lms)
export PATH=$PATH:/Users/authorproxy/.lmstudio/bin

# Gemini CLI API key
export GOOGLE_CLOUD_LOCATION=us-central1
source $PROJECTS/API_KEYS/zsh/gemini.zsh

## Windsurf AI
export PATH="/Users/authorproxy/.codeium/windsurf/bin:$PATH"

# Load local and global binaries
export PATH=/usr/local/bin:$HOME/.local/bin:$HOME/.local/sbin:$PATH

# Added LazyVim mason package manager bin folder
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
