# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="frappe" # mocha, frappe, macchiato, latte
CATPPUCCIN_SHOW_TIME=true

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="%F{red} .....%f"
HIST_STAMPS="%b %dm, %H:%M"

# update omz automatically without asking
zstyle ':omz:update' mode auto

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  dotenv
  macos
  sudo
  zsh-interactive-cd
)

source $ZSH/oh-my-zsh.sh

# User configuration
source $DOT_FILES/zsh/proxy.init.zsh
