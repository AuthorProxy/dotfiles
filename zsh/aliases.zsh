### ALIASES ###
# helpers
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ccd='clear && cd'
alias mkdir="mkdir -p"
alias h="history"
alias path="command -v" # the actual path of the command to be executed
alias which="type -a" # aliases, functions, built-ins, showing all shell interpretations.
alias which2="whereis" # locate the binary, source, and manual page files for a command

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

alias lnse='f() { if [ ! -e "$1" ]; then echo "Error: source file \"$1\" does not exist"; return 1; fi; ln -s "$1" "$2"; }; f'
alias reload="source ~/.zshrc"
alias nproc="sysctl -n hw.physicalcpu" # macOS equivalent of nproc
alias vpn-start="scutil --nc start \"v2RayTun\""
alias vpn-stop="scutil --nc stop \"v2RayTun\""

# system tools replacements or renamings
alias find="fd --hidden --exclude .git --exclude node_modules"
alias ls="eza --almost-all --long --git --icons --group-directories-first --octal-permissions --time-style='+%d %b, %Y %H:%M'"
alias ls2="lsd --almost-all --long --git --group-directories-first --date='+%d %b, %Y %H:%M' --blocks=permission,user,size,date,git,name"
alias grep="rg --hidden --smart-case -C 2"
alias highlight="grep --passthru"
alias hl="highlight"
alias less="delta"
alias ps="procs"
alias cat="bat"
alias clip="pbcopy"
alias copy="pbcopy"
alias vi="nvim"
alias vim="nvim"

# sometime you need the old commands
alias _find="command find"
alias _ls="command ls"
alias _grep="command grep"

# tools
alias tmux="tmux -2"
alias vt="nvim -c 'terminal' -c 'wincmd o'"

alias lg="lazygit"
alias pn="pnpm"
alias qs="open -a /Applications/QSpace\ Pro.app/Contents/MacOS/QSpace\ Pro"

# nb work aliases
alias ds-bby-ctrl-electron="cd ${NERDY_HOME}/ds-client-core && yarn run:electron -a bby-controller -e local -u http://localhost:5252"
alias ds-bby-ctrl-applet="cd ${NERDY_HOME}/ds-client-core && yarn start:applet -a bby-controller -e local -p 5252"
alias ds-bby-display-electron="cd ${NERDY_HOME}/ds-client-core && yarn run:electron -a bby-display -e local"
alias ds-bby-display-applet="cd ${NERDY_HOME}/ds-client-core && yarn start:applet -a bby-display -e local"
alias ds-cli="cd ${NERDY_HOME}/ds-cli && ./dscli.js -e local"
alias ds-cli:dev="cd ${NERDY_HOME}/ds-api/scripts/dscli && ./dscli.js -s vmdev -e dev"
alias ds-api="npx kill-port 3000 &>/dev/null && cd ${NERDY_HOME}/ds-api && make && ./local-dev/start-dev.sh --run-migrations"
alias ds-api:up="cd ${NERDY_HOME}/ds-api && ./local-dev/ds-migrate.sh up"
alias ds-web="npx kill-port 4444 &>/dev/null && cd ${NERDY_HOME}/ds-web && yarn start"
alias ds-web:dev="npx kill-port 4444 &>/dev/null && cd ${NERDY_HOME}/ds-web && yarn start:dev"
