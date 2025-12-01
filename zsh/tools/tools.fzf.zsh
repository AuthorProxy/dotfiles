source <(fzf --zsh)
source $DOT_FILES/zsh/external/catppuccin-fzf/themes/catppuccin-fzf-frappe.sh

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
-m --pointer=󱨚 --marker=󱨚 \
--border=horizontal \
--border-label-pos=-5 \
--border-label='| 4 8 15 16 23 42 |' \
--preview \
'([ -f {} ] && bat --color=always --style=numbers --line-range=:500 {}) \
|| ([ -d {} ] && lsd --almost-all --long --git --group-directories-first --blocks=\"git,name\" --tree {} | head -200) \
|| echo {}'";

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview "lsd --almost-all --long --git --group-directories-first --blocks='git,name' --tree {} | head -200" ;;
    *)            fzf "$@" ;;
  esac
}
