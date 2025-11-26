# Enhanced directory-first completion
zstyle ':completion:*' list-dirs-first true # dirs first
zstyle ':completion:*' file-sort name # files and dirs sort by name

# work around for mixed files and names
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{#f2d5cf}%U%B%d%b%u%f' # catppuccin frappe rosewater

unsetopt LIST_TYPES # disable / @ * indicators in completion listings

setopt GLOB_DOTS # show dot files
zstyle ':completion:*' special-dirs false # but hide ./ and ../
