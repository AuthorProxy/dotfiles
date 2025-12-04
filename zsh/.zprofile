# brew installation
eval "$(/opt/homebrew/bin/brew shellenv)"

# GNU tools replacement (don't take precedence over system in .zshenv)
export PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/make/libexec/gnubin:$PATH"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
