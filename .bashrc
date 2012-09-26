# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

[[ $HOME/.commonrc ]] && source $HOME/.commonrc
source $HOME/git/ghar/ghar-bash-completion.sh
[[ $HOME/.bash_prompt ]] && source $HOME/.bash_prompt

gitcomp=/usr/share/doc/git-1.7.1/contrib/completion/git-completion.bash
test -f $gitcomp && . $gitcomp

if [[ $( which hub ) ]]
then
  eval "$( hub alias -s )"
# hub tab-completion script for bash.
# This script complements the completion script that ships with git.

# Check that git tab completion is available
if declare -F _git > /dev/null; then
  # Duplicate and rename the 'list_all_commands' function
  eval "$(declare -f __git_list_all_commands | \
        sed 's/__git_list_all_commands/__git_list_all_commands_without_hub/')"

  # Wrap the 'list_all_commands' function with extra hub commands
  __git_list_all_commands() {
    cat <<-EOF
alias
pull-request
fork
create
browse
compare
EOF
    __git_list_all_commands_without_hub
  }

  # Ensure cached commands are cleared
  __git_all_commands=""
fi
fi


