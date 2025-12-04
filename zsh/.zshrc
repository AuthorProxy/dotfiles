# Use this for sourcing files safely
source_if_exists() {
  if [[ -f "$1" ]]; then
    . "$1"
  else
    echo "Warning: File to source '$1' does not exist. Check your setup."
  fi
}

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

source_if_exists $ZSH/oh-my-zsh.sh

# User configuration
source_if_exists $DOT_FILES/zsh/proxy.init.zsh
