autoload -U add-zsh-hook

# Starship shell https://starship.rs ##
eval "$(starship init zsh)"
export PATH="/usr/local/sbin:$PATH"

# Zoxide (cd analog) ##
eval "$(zoxide init zsh --cmd cd)"

# External prompts and commands
source $DOT_FILES/zsh/tools/tools.transient-prompt.zsh
source $DOT_FILES/zsh/tools/tools.tab-suggestions.zsh
source $DOT_FILES/zsh/tools/tools.bat.zsh
source $DOT_FILES/zsh/tools/tools.fzf.zsh
source $DOT_FILES/zsh/tools/tools.nvmrc.zsh

source $DOT_FILES/zsh/external/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a5adce" # catppuccin frappe zsh-autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history) # history completion match_prev_cmd

source $DOT_FILES/zsh/tools/tools.custom-snippets.zsh
