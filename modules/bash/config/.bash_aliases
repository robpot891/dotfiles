#!/bin/bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto --group-directories-first'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias serve='python3 -m http.server'

# Open ~/diary/[today].md in vim
alias diary='mkdir -p ~/diary && vim ~/diary/`date +"%Y-%m-%d"`.md'

# git status for all sub-directories in ~/dev
alias wst='echo -e "\033[33m~~~git status on ~/dev~~~\033[0m"; for dir in $(ls ~/dev); do echo -e "\033[32m"$dir"\033[0m"; git -C ~/dev/$dir status -s; done'

# Quick alias for find in current directory
alias f='find . -name'

alias c='code-insiders'

# Source .bash_aliases_local if it exists for .bash_aliases commands specific to this
# machine.
if [ -r ~/.bash_aliases_local ]; then
  . ~/.bash_aliases_local
fi

alias up='sudo apt update && sudo apt install code-insiders'

if which hub &> /dev/null; then
  alias git='hub'
fi
