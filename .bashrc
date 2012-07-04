# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

[[ $HOME/.commonrc ]] && source $HOME/.commonrc
source $HOME/git/ghar/ghar-bash-completion.sh
