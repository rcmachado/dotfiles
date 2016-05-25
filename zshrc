source "$HOME/.antigen/antigen.zsh"

export EDITOR="vim"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export GOPATH="$HOME/Developer/go-workspace"

# Avoid Homebrew sending data to Google Analytics
export HOMEBREW_NO_ANALYTICS=1

test -e "${HOME}/.python" && source "${HOME}/.python"

DOTFILES="$HOME/.dotfiles"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle git
antigen bundle pip
antigen bundle pyenv
antigen bundle django

antigen bundle rbenv

antigen bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

antigen apply

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init -)"

source "$HOME/.aliases"
source "$HOME/.colors"
source "$HOME/.functions"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
