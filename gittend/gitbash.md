# To see what shell you are using, you can:

```echo $SHELL```
and it will tell you.

Use the below only if you are using bash.

Run the following to create `~/.git-completion.bash`:

    curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
    
and `~/.git-prompt.sh`:

    curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.bash


Then add the following to your `~/.bashrc` or `~/.bash_profile` after `PATH`:

    # Set the base PS1
    export PS1="\t: \W$ "

    # Source the git bash completion file
    if [ -f ~/.git-completion.bash ]; then
        source ~/.git-completion.bash
        source ~/.git-prompt.bash
        PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
    fi

    export PS1

This will display the branch name next to the folder name in the bash prompt.



# Some console utilities
GIT Windows:

  Babun: http://babun.github.io/
  
  Cmder: http://cmder.net/
  
  Cygwin: https://www.cygwin.com/
  
  Powershell: https://github.com/dahlbyk/posh-git
  
    - (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
    
    - Install-Module posh-git
