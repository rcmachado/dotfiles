#!/bin/bash
#
# Bash profile
#

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Bash history configuration
export HISTSIZE=10000
export SAVEHIST=10000
export HISTCONTROL=ignoredups
export PROMPT_COMMAND='history -a'
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTFILE="$HOME/.bash_history"
shopt -s histappend
shopt -s cmdhist

# Vim, as usual
export EDITOR="vim"

# PATH customization
export PATH="/usr/local/bin:/usr/local/sbin:$(brew --prefix josegonzalez/php/php53)/bin:/usr/local/share/npm/bin:/usr/local/heroku/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

# lolcommits - enable fork process for runner
LOLCOMMITS_FORK=1

# Load other bash stuff
[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
[[ -f "$HOME/.bash_colors" ]] && source "$HOME/.bash_colors"

# AWS stuff
[[ -f "$HOME/.aws.sh" ]] && source "$HOME/.aws.sh"

# Python stuff
[[ -f "$HOME/.python.sh" ]] && source "$HOME/.python.sh"

# Activate RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Git prompt
source "/usr/local/etc/bash_completion.d/git-prompt.sh"
[[ -f "$HOME/.git-prompt.sh" ]] && source "$HOME/.git-prompt.sh"

# Homebrew bash completion
HOMEBREW_COMPLETION="`brew --prefix`/etc/bash_completion"
[[ -f "$HOMEBREW_COMPLETION" ]] && source "$HOMEBREW_COMPLETION"

venv_activate() {
    [ -e .venv ] && workon `cat .venv`
}
venv_cd() {
    builtin cd "$@" && venv_activate
}
alias cd="venv_cd"