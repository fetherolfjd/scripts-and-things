# Begin ~/.bashrc
# Written by Justin D. Fetherolf

# Personal aliases and functions

# Make prompt have useful information
export PS1="[\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;31m\]\H\[\e[0m\]] [\[\e[0;32m\]\w\[\e[0m\]] \$ "

# Set the history to unlimited
export HISTFILESIZE=10000
export HISTSIZE=10000

# Add current directory to PATH
pathappend .

# Make ls a little more informational
alias la='ls -aF'
alias ll='ls -lF'
alias lla='la -alF'
alias ls='ls -F'

# Made navigating directories a little quicker
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Make my repos easy to get to
repos () {
   if [ -d "${HOME}/repos" ]; then
      cd ${HOME}/repos
   else
      echo "${HOME}/repos does not exist!"
   fi
}

# Auto complete git branch names and stuff
if [ -f "${HOME}/.git-completion.bash" ]; then
   source ${HOME}/.git-completion.bash
fi

# End ~/.bashrc
