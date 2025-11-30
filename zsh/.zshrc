# Brew installation
export HOMEBREW_BAT=1
export HOMEBREW_NO_ENV_HINTS=true
export HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS=1

# Bitwarden https://community.bitwarden.com/t/support-browser-integration-for-unlock-with-biometrics-for-homebrew-installs/58295/5
export ALLOW_BROWSER_INTEGRATION_OVERRIDE=true

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
  export PAGER="less -FR"
  export MANPAGER="less -FR"
else
  export EDITOR='nvim'
  export VISUAL='nvim'
  export PAGER="bat"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Setup LS Colors to use catppuccin theme
export LS_COLORS="$(vivid generate catppuccin-mocha)"

## Enable persistent history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## Completions
source $HOME/completion-for-pnpm.zsh
source $HOME/completion-for-ngrok.zsh
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


## Parallelize make builds
# cores=$(expr $(nproc) / 2) # [UBUNTU]
cores=$(expr $(sysctl -n hw.physicalcpu) / 2) # [MACOS]
export MAKEFLAGS="-j$cores -O"
# export GNUMAKEFLAGS="-j$cores -O" # 4.x version

source $DOT_FILES/zsh/aliases.zsh
source $DOT_FILES/zsh/tools/init.zsh

test_inf() {
  while :; do
    echo 'This will never end, except if you hit CTRL+C'
    sleep 1
  done
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview "lsd --almost-all --long --git --group-directories-first --blocks='git,name' --tree {} | head -200" ;;
    *)            fzf "$@" ;;
  esac
}

autoload -Uz compinit && compinit

# should be last to correctly enable syntax highlighting
source $DOT_FILES/zsh/external/catppuccin-zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh
source $DOT_FILES/zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
