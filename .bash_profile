# .bash_profile

# User specific environment and startup programs
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH

export gitdir=$HOME/git
[[ $( uname -s ) == 'Darwin' ]] && export gitdir=$HOME/Documents/Development

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

### Text editing
export EDITOR='vi'
which subl 2>&1 >/dev/null && export EDITOR='subl -w'
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

# Disable hibernate mode
#sudo pmset -a hibernatemode 0
# Disable sudden motion sensor
#sudo pmset -a sms 0


export VIRTUAL_ENV_DISABLE_PROMPT=1
source $HOME/.local/ansible/bin/activate

[[ -d ~/perl5 ]] && source ~/perl5/perlbrew/etc/bashrc
[[ -d /usr/local/share/npm/bin ]] && export PATH=$PATH:/usr/local/share/npm/bin

