## colorized help output using bat
alias bathelp="bat --plain --language=help"
alias -g -- -h="-h 2>&1 | bat --language=help --style=plain"
alias -g -- --help="--help 2>&1 | bat --language=help --style=plain"

## helper function to show help with bat formatting
help() {
    "$@" --help 2>&1 | bathelp
}
