# Brew installation
export PATH="/usr/local/sbin:$PATH"

# Cursor CLI
export PATH="$HOME/.local/bin:$PATH"

# Console Ninja
export PATH="$HOME/.console-ninja/.bin:$PATH"

# Gemini CLI API key
export GOOGLE_CLOUD_LOCATION=us-central1
source $PROJECTS/API_KEYS/zsh/gemini.zsh

# Windsurf AI
export PATH="/Users/authorproxy/.codeium/windsurf/bin:$PATH"

# Completions
source $HOME/completion-for-pnpm.zsh
source $HOME/completion-for-ngrok.zsh
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# Setup NVM
export NVM_DIR="$HOME/.nvm"

# This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Enable persistent history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Parallelize make builds
# cores=$(expr $(nproc) / 2) # [UBUNTU]
cores=$(expr $(sysctl -n hw.physicalcpu) / 2) # [MACOS]
export MAKEFLAGS="-j$cores -O"
# export GNUMAKEFLAGS="-j$cores -O" # 4.x version

source $DOT_FILES/zsh/aliases.zsh
source $DOT_FILES/zsh/tools/init.zsh

autoload -Uz compinit && compinit
