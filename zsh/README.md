## CLI EVERYDAY TOOLS

- git and git-credential-manager-core
- awk - text-processing tool (GNU Version)
- make - text-processing tool (GNU Version)
- fzf - fuzzy finder
- eza, lsd - modern ls replacements
- bat - modern cat replacement
- batextras - bat helpers (batdiff, batgrep, batman, batpipe, batwatch, prettybat)
- rg (ripgrep) - modern grep replacement
- rga (ripgrep-all) - wrapped ripgrep with media files support (subs, pdfs, zips, etc.)
- sg (ast-grep) - code structural search grep based on AST
- mtr - modern traceroute + ping replacement
- fd - modern find replacement
- jq - json data processor
- yq - json, yaml, xml, ini and others data processor
- delta (git-delta) - modern git diff replacement
- tree - directories tree, required as dependency for forgit
- procs - modern ps replacement
- tmux - terminal multiplexer
- forgit - git console utilities with fzf support
- z (zoxide) - smarter cd replacement

## OTHER TOOLS

- starship - cross-shell prompt
- lazygit - terminal-based git ui
- nvm - node version manager
- nvim (neovim) - hyperextensible Vim-based text editor
- ngrock - secure tunnels to localhost
- vivd - generator for LS_COLORS env variable
- warp-cli - AI-powered terminal
- rustup - rust lang installer
- stylelint - linter for css files (required by extensions)
- mbake - linter for make files (required by extensions)

### NeoVim and LazyVim dependencies (not listed before)

- gs (ghostscript) - for rendering PDF-files
- tree-sitter-cli - incremental syntax parsing library
- tectonic - for rendering LaTeX math expressions
- mmdc (mermaid-cli) - for rendering Mermaid diagrams
- python3 (and pip3) - needed to install pipx
- pipx - PyPI packages manager to run apps in isolated environmant
- hererocks - tool to install luarocks and lua locally in folder

## Installation

- brew tap microsoft/git && brew install git && brew install --cask git-credential-manager-core
- brew install starship lazygit nvm neovim ngrok vivid stylelint
- brew tap warpdotdev/warp && brew update && brew install --cask warp-cli
- brew install rustup && $(brew --prefix rustup)/bin/rustup-init
- brew install make gawk fzf lsd eza bat ripgrep rga ast-grep mtr fd jq yq git-delta procs zoxide
- brew install pandoc poppler ffmpeg
- pip3 install mbake

### NeoVim/LazyVim dependencies

> **Note** to view all problems start nvim and enter :checkhealthq command

- brew install ghostscript python3 pipx
- pipx install hererocks
- hererocks ~/.local/share/nvim/lazy-rocks/hererocks --lua=5.1 --luarocks=latest
- :MasonInstall tree-sitter-cli | MasonInstall tectonic | MasonInstall mmdc
