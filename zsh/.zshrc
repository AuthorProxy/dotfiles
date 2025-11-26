# Brew installation
export HOMEBREW_NO_ENV_HINTS=true

# Bitwarden https://community.bitwarden.com/t/support-browser-integration-for-unlock-with-biometrics-for-homebrew-installs/58295/5
export ALLOW_BROWSER_INTEGRATION_OVERRIDE=true

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
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

autoload -Uz compinit && compinit
