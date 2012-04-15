# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
if [[ $TERM ==  'xterm' ]]; then
  TERM='xterm-256color';
fi

if [[ -d $HOME/git/ghar ]]; then
  PATH=$PATH:$HOME/git/ghar/bin
  . $HOME/git/ghar/ghar-bash-completion.sh
fi

export PATH

EDITOR=vim
export EDITOR


function rtm {
  echo d rtm $1 | bti
}

[[ $TERM == "screen" ]] && export  TERM="screen-256color"

