autoload -U add-zsh-hook

# External prompts and commands
source $DOT_FILES/zsh/tools/tools.transient-prompt.zsh
source $DOT_FILES/zsh/tools/tools.tab-suggestions.zsh
source $DOT_FILES/zsh/tools/tools.bat.zsh
source $DOT_FILES/zsh/tools/tools.nvmrc.zsh

# Starship shell https://starship.rs ##
eval "$(starship init zsh)"
export PATH="/usr/local/sbin:$PATH"

# fzf key bindings and fuzzy completion ##
source <(fzf --zsh)
source $DOT_FILES/zsh/external/catppuccin-fzf/themes/catppuccin-fzf-frappe.sh

# Zoxide (cd analog) ##
eval "$(zoxide init zsh)"

source $DOT_FILES/zsh/tools/tools.custom-snippets.zsh
