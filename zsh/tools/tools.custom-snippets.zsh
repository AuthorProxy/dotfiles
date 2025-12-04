# a never-ending loop for tests
test_inf() {
  while :; do
    echo 'This will never end, except if you hit CTRL+C'
    sleep 1
  done
}

# kill a process on a specified port
kill_port() {
  if [ -n "$1" ]
  then
    lsof -ti :"$1" | xargs kill -9
  else
    echo "Pass in the port number."
  fi
}

# Kill a process by name
kill_name() {
  # list processes, fuzzy-pick lines, extract PID(s), kill with -9
  ps | fzf -m | awk '{print $2}' | xargs -r kill -9
}

# Yazi file manager ##
# https://yazi-rs.github.io/docs/quick-start
y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Warp ai agent helper ##
# ex.:> ai open hosts file
ai() {
	warp agent run --prompt "$*"
}

# Fancy Z snippet ##
# ctrl+z - save unfinished command to buffer, or fg if line is empty
fancy-ctrl-z() {
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

# COMPLETION_WAITING_DOTS analog from OMZ, disabled since I am using OMZ now
# expand-or-complete-with-dots() {  # This bunch of code displays red dots when
#   echo -n "\e[31m......\e[0m"     # autocompleting a command with the tab key,
#   zle expand-or-complete          # "Oh-my-zsh"-style.
#   zle redisplay
# }
# zle -N expand-or-complete-with-dots
# bindkey "^I" expand-or-complete-with-dots
