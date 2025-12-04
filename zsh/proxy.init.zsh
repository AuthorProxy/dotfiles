# Default settings
setopt CORRECT # commands correction
export GPG_TTY=$(tty) # default gpg tty
export LANG="en_US.UTF-8" # default lang

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

# Setup 'ls <tab>' to use catppuccin theme
export LS_COLORS="$(vivid generate catppuccin-mocha)"
export ZLS_COLORS="$LS_COLORS"

zmodload zsh/complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Setup prompt correction to use catppuccin theme
export SPROMPT=$'zsh: correct \e[38;2;231;130;132m%R\e[0m to \e[38;2;166;209;137m%r\e[0m [\e[38;2;202;158;230mN\e[38;2;239;159;118my\e[38;2;140;170;238ma\e[38;2;129;200;190me\e[0m]?'

## Enable persistent history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## Completions
source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh
source $DOT_FILES/zsh/tools/pnpm/completion-for-pnpm.zsh
source $DOT_FILES/zsh/tools/ngrok/completion-for-ngrok.zsh
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

test_inf() {
  while :; do
    echo 'This will never end, except if you hit CTRL+C'
    sleep 1
  done
}

source $DOT_FILES/zsh/proxy.aliases.zsh
source $DOT_FILES/zsh/tools/tools.init.zsh
autoload -Uz compinit && compinit

# should be last to correctly enable syntax highlighting
source $DOT_FILES/zsh/external/catppuccin-zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh
source $DOT_FILES/zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
