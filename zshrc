source "$HOME/.antigen/antigen.zsh"

export EDITOR="vim"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting

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

source "$HOME/.dotfiles/aliases"
