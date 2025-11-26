# colorized help output using bat
alias bathelp="bat --plain --language=help"

# alternative to global -h and --help is :h and :help postfix
# don't override -h or --help because it breaks oh my zsh and other potential tools where -h is --human for example
alias -g :h='-h 2>&1 | bat --language=help --style=plain'
alias -g :help='-h 2>&1 | bat --language=help --style=plain'

# helper function to show help with bat formatting
help() {
  "$@" --help 2>&1 | bathelp
}
