# .bashrc
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc
[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt

### Shell environment set up
shopt -s histappend #Append to history file
HISTCONTROL=ignoreboth # Don't put duplicate or line starting with a space in the history file
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize # Check window size after each command

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x $(which lesspipe) ]] && eval "$(SHELL=/bin/sh $(which lesspipe))"

if [[ $(uname -s) == 'Darwin' ]]
then
  alias ls='ls -G'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Run keychain if it's installed and source the configuration
keychain -v >/dev/null 2>&1 && keychain && source $HOME/.keychain/$(hostname)-sh

export JAVA_HOME=/usr

if [ -d $HOME/.local/IAMCli ]
then
  export AWS_IAM_HOME=$HOME/.local/IAMCli
  export PATH=$PATH:$AWS_IAM_HOME/bin
fi

if [ -d $HOME/.local/ec2-api-tools ]
then
  export EC2_HOME=$HOME/.local/ec2-api-tools
  export PATH=$PATH:$EC2_HOME/bin
fi



