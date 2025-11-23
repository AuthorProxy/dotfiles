#  External prompts and commands

source $DOT_FILES/zsh/tools/tools.bat.zsh


## Starship shell https://starship.rs ##
eval "$(starship init zsh)"
export PATH="/usr/local/sbin:$PATH"


## fzf key bindings and fuzzy completion ##
source <(fzf --zsh)


## Zoxide (cd analog) ##
eval "$(zoxide init zsh)"


## NVM autoload ##
### automatically use nvmrc node js version https://github.com/nvm-sh/nvm?tab=readme-ov-file#zsh
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc


## Yazi file manager ##
### https://yazi-rs.github.io/docs/quick-start
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


## Warp ai agent helper ##
### ex.:> ai open hosts file
function ai() {
	warp agent run --prompt "$*"
}


## Fancy Z snippet ##
### ctrl+z - save unfinished command to buffer, or fg if line is empty
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
