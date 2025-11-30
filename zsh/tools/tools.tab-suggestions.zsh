# disable automatic correction of the commands
unsetopt CORRECT

# disable / @ * indicators in completion listings
unsetopt LIST_TYPES

# interactive menu selection
zstyle ':completion:*:*:*:*:*' menu select

# human readable descriptions, auto-generated when missed
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%U%B%d%b%u'

# styling "did you mean X?"
zstyle ':completion:*:corrections' format ' %F{#a6d189}--> %U%B%d%b%u (errors: %e) <--%f' # frappe green catpp

# styling completion system messages
zstyle ':completion:*:messages' format ' %F{#ca9ee6}# %U%B%d%b%u %f' # frappe mauve catpp

# styling "no matches found"
zstyle ':completion:*:warnings' format ' %F{#8caaee}--> no matches found <--%f' # frappe blue catpp

# styling for long lists: "x matches"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Enhanced directory-first completion
zstyle ':completion:*' list-dirs-first true # dirs first
zstyle ':completion:*' file-sort name # files and dirs sort by name

# work around for mixed files and names
zstyle ':completion:*:matches' group 'yes' # force grouping
zstyle ':completion:*' group-name '' # force internal names for grouping
zstyle ':completion:*' format ' %F{#eebebe}# %U%B%d%b%u %f' # frappe flamingo catpp
zstyle ':completion:*:descriptions' format ' %F{##eebebe}# %U%B%d%b%u %f' # frappe flamingo catpp

setopt GLOB_DOTS # show dot files
zstyle ':completion:*' special-dirs false # but hide ./ and ../

# shows descriptive headers and more context
zstyle ':completion:*' verbose yes
