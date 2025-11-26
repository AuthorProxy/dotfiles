# CLI EVERYDAY TOOLS

- atuin - modern shell history manager
- fzf - fuzzy finder
- eza, lsd - modern ls replacements
- bat - modern cat replacement
- batextras - bat helpers (batdiff, batgrep, batman, batpipe, batwatch, prettybat)
- rg (ripgrep) - modern grep replacement
- sg (ast-grep) - code structural search grep based on AST
- mtr - modern traceroute + ping replacement
- fd - modern find replacement
- jq - json data processor
- yq - json, yaml, xml, ini and others data processor
- delta - modern git diff replacement
- procs - modern ps replacement
- z (zoxide) - smarter cd replacement

## OTHER TOOLS

- starship - cross-shell prompt
- lazygit - terminal-based git ui
- nvim (neovim) - hyperextensible Vim-based text editor
- nvm - node version manager
- ngrock - secure tunnels to localhost
- vivd - generator for LS_COLORS env variable
- warp-cli - AI-powered terminal

### NeoVim and LazyVim related tools (not listed before)

- tree-sitter-cli - incremental syntax parsing library
- gs (ghostscript) - for rendering PDF-files
- tectonic - for rendering LaTeX math expressions
- mmdc (mermaid-cli) - for rendering Mermaid diagrams
- python3 (and pip3) - needed to install pipx
- pipx - PyPI packages manager to run apps in isolated environmant
- hererocks - tool to install luarocks and lua locally in folder

## Installation

- brew install starship lazygit neovim nvm ngrok vivid
- brew tap warpdotdev/warp && brew update && brew install --cask warp-cli
- brew install fzf lsd eza bat ripgrep ast-grep mtr fd jq yq git-delta procs zoxide

### NeoVim/LazyVim dependencies

> **Note** to view all problems start nvim and enter :checkhealthq command

- brew install python3 pipx
- pipx install hererocks
- hererocks ~/.local/share/nvim/lazy-rocks/hererocks --lua=5.1 --luarocks=latest
- brew install tree-sitter-cli ghostscript tectonic mermaid-cli
