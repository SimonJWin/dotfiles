# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load anything in the extra folder
for f in ~/.bashrc-pre.d/*; do source $f; done

# Load bash aliases.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR=vi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Load homebrew's bash completions.
  [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
fi

# Load anything in the extra folder
for f in ~/.bashrc-post.d/*; do source $f; done
