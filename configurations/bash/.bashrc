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

# Set environment with Maven home directory
export M2_HOME=~/opt/apache-maven-3.3.3
pathappend ${M2_HOME}/bin

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

alias build="${HOME}/repos/dcsdSoftware/utils/tools/build.sh Common CommonService"
alias buildEpr='build EprModel EprService'
alias buildDWT='build DrupalWebTests'

# Make my repos easy to get to
repos () {
   if [ -d "${HOME}/repos" ]; then
      cd ${HOME}/repos
   else
      echo "${HOME}/repos does not exist!"
   fi
}

# Make getting to DCSD directory easy
dcsd () {
   if [ -d "${HOME}/repos/dcsdSoftware" ]; then
      cd ${HOME}/repos/dcsdSoftware
   else
      echo "${HOME}/repos/dcsdSoftware does not exist!"
   fi
   git status
}

# shortcut to employee repo
employee () {
   if [ -d "${HOME}/repos/dcsdSoftware/drupal/employee/employee" ]; then
      cd ${HOME}/repos/dcsdSoftware/drupal/employee/employee
   else
      echo "${HOME}/repos/dcsdSoftware/drupal/employee/employee does not exist!"
   fi
   git status
}

# shortcut to phpcommon repo
phpcommon () {
   if [ -d "${HOME}/repos/dcsdSoftware/phpcommon" ]; then
      cd ${HOME}/repos/dcsdSoftware/phpcommon
   else
      echo "${HOME}/repos/dcsdSoftware/phpcommon does not exist!"
   fi
   git status
}

# Auto complete git branch names and stuff
if [ -f "${HOME}/.git-completion.bash" ]; then
   source ${HOME}/.git-completion.bash
fi

# Run Client integration tests
alias runCInt='mvn -PclientTests -fn test'

function runInt () {
  mvn -fn test -Djavax.net.ssl.keyStore=/Users/jfetherolf/repos/dcsdSoftware/twv-rs01.vagrant.dcsd.jks -Djavax.net.ssl.keyStorePassword='dc$d20!2' -Pintonly -fn test;
}

# Run old client integration tests that don't use server (probably avoid)
# function runInt(){
# mvn  -fn test -Djavax.net.ssl.keyStore=/Users/jfetherolf/repos/dcsdSoftware/twv-rs01.vagrant.dcsd.jks -Djavax.net.ssl.keyStorePassword='dc
# }

# End ~/.bashrc
