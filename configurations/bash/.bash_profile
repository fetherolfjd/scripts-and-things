# Begin ~/.bash_profile
# Written for Justin D. Fetherolf
# by Justin D. Fetherolf

# Personal environment variables and startup programs.

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
   local IFS=':'
   local NEWPATH
   local DIR
   local PATHVARIABLE=${2:-PATH}
   for DIR in ${!PATHVARIABLE} ; do
      if [ "$DIR" != "$1" ] ; then
         NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
      fi
   done
   export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
   pathremove $1 $2
   local PATHVARIABLE=${2:-PATH}
   export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
   pathremove $1 $2
   local PATHVARIABLE=${2:-PATH}
   export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

# Personal aliases and functions should go in ~/.bashrc.

if [ -f "$HOME/.bashrc" ]; then
   source $HOME/.bashrc
fi

if [ -d "$HOME/bin" ]; then
   pathprepend $HOME/bin
fi

if [ -f "$HOME/.inputrc" ]; then
   source $HOME/.inputrc
fi

# End ~/.bash_profile
