# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# Bodge the TERM into 256colors
[[ $TERM == 'screen' || $TERM == 'xterm' ]] && export TERM=${TERM}-256color

# Set OS specific values
case $(uname -s) in
  Darwin)
    gitdir=$HOME/Development
    ;;
  *)
    gitdir=$HOME/git
esac
export gitdir

test -f ~/.ghar-bash-completion.sh && . ~/.ghar-bash-completion.sh
test -f ~/.git-completion.sh && . ~/.git-completion.sh
test -f ~/.bash_prompt} && . ~/.bash_prompt

export EDITOR=vim

# Add ghar to PATH and add completion if running bash
[[ -d $gitdir/ghar/bin ]] && export PATH=$gitdir/ghar/bin:$PATH

# Setup vim
[[ -f ${s=$HOME/.vim/setup.sh} ]] && $s

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


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
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
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

if [ -f $HOME/.localrc ]
then
  . $HOME/.localrc
fi

if [[ -d /var/cfengine/bin/ ]]
then
  PATH=$PATH:/var/cfengine/bin
fi

. ~/.bash_prompt
