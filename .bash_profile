# .bash_profile

# User specific environment and startup programs
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH

export gitdir=$HOME/git
[[ $( uname -s ) == 'Darwin' ]] && export gitdir=$HOME/Development

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

### Text editing
[[ -f '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl' ]] && \
	alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
export EDITOR='vi'
alias subl 2>&1 >/dev/null && export EDITOR='subl -w'
[[ -f $HOME/.vim/setup.sh ]] && $HOME/.vim/setup.sh

### Ruby environment
if [[ -d /usr/local/var/rbenv ]]
then
	export RBENV_ROOT=/usr/local/var/rbenv
	if which rbenv >/dev/null; then eval "$(rbenv init -)"; fi
fi

### ghar
[[ -d $gitdir/ghar/bin ]] && export PATH=$gitdir/ghar/bin:$PATH
[[ -f ~/.ghar-bash-completion.sh  ]] && source ~/.ghar-bash-completion.sh

### bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
