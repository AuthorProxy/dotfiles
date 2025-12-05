### ALIASES ###
# helpers
alias h="history"
alias ccd='() { clear && cd "${1:-.}"; }'
alias path="command -v" # the actual path of the command to be executed
alias which="type -a" # aliases, functions, built-ins, showing all shell interpretations.
alias which2="whereis" # locate the binary, source, and manual page files for a command
alias fd="fd --hidden --exclude .git --exclude node_modules"
alias rg="rg --no-messages --hidden --smart-case -C 2"

# sometime you need the old commands
alias _find="command find"
alias _ls="command ls"
alias _grep="command grep"

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

# lnse $SRC $DEST or # lnse -f $SRC $DEST
alias lnse='f() { opts=(); while [ "${1#-}" != "$1" ]; do opts+=("$1"); shift; done; if [ ! -e "$1" ]; then echo "Error: source file \"$1\" does not exist"; return 1; fi; src=$1; dest=$2; shift 2; ln -sn "${opts[@]}" "$src" "$dest" "$@"; }; f'
alias reload='source $HOME/.zshrc && [[ -n $TMUX ]] && tmux source $XDG_CONFIG_HOME/tmux/tmux.conf'
alias nproc="sysctl -n hw.physicalcpu" # macOS equivalent of nproc
alias vpn-start="scutil --nc start \"v2RayTun\""
alias vpn-stop="scutil --nc stop \"v2RayTun\""

# system tools replacements or renamings
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias find="fd"
alias grep="rg"
alias ls="eza --almost-all --long --git --icons --group-directories-first --octal-permissions --time-style='+%d %b, %Y %H:%M'"
alias ls2="lsd --almost-all --long --git --group-directories-first --date='+%d %b, %Y %H:%M' --blocks=permission,user,size,date,git,name"
alias highlight="grep --passthru"
alias hl="highlight"
alias less="delta"
alias ps="procs"
alias cat="bat"
alias clip="pbcopy"
alias copy="pbcopy"
alias vi="nvim"
alias vim="nvim"

# tools
alias tmux="tmux -2"
alias vt="nvim -c 'terminal' -c 'wincmd o'"

alias lg="lazygit"
alias pn="pnpm"
alias qs="open -a /Applications/QSpace\ Pro.app/Contents/MacOS/QSpace\ Pro"

# nb work aliases
# alias ds-bby-ctrl-electron="cd ${NERDY_HOME}/ds-client-core && yarn run:electron -a bby-controller -e local -u http://localhost:5252"
# alias ds-bby-ctrl-applet="cd ${NERDY_HOME}/ds-client-core && yarn start:applet -a bby-controller -e local -p 5252"
# alias ds-bby-display-electron="cd ${NERDY_HOME}/ds-client-core && yarn run:electron -a bby-display -e local"
# alias ds-bby-display-applet="cd ${NERDY_HOME}/ds-client-core && yarn start:applet -a bby-display -e local"
# alias ds-cli="cd ${NERDY_HOME}/ds-cli && ./dscli.js -e local"
# alias ds-cli:dev="cd ${NERDY_HOME}/ds-api/scripts/dscli && ./dscli.js -s vmdev -e dev"
# alias ds-api="npx kill-port 3000 &>/dev/null && cd ${NERDY_HOME}/ds-api && make && ./local-dev/start-dev.sh --run-migrations"
# alias ds-api:up="cd ${NERDY_HOME}/ds-api && ./local-dev/ds-migrate.sh up"
# alias ds-web="npx kill-port 4444 &>/dev/null && cd ${NERDY_HOME}/ds-web && yarn start"
# alias ds-web:dev="npx kill-port 4444 &>/dev/null && cd ${NERDY_HOME}/ds-web && yarn start:dev"
