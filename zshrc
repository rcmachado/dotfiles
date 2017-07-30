source "$HOME/.antigen/antigen.zsh"

export EDITOR="vim"

# Avoid Homebrew sending data to Google Analytics
export HOMEBREW_NO_ANALYTICS=1

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

# NVM
export NVM_DIR="/Users/rcmachado/.nvm"
export NVM_LAZY_LOAD=true

DOTFILES="$HOME/.dotfiles"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search

    brew
    common-aliases
    extract
    heroku
    osx
    rsync
    sudo
    terraform
    vagrant

    autoenv
    git
    github
    gitignore
    arialdomartini/oh-my-git

    celery
    postgres
    redis-cli

    python
    pyenv
    pip
    virtualenv

    node
    npm
    lukechilds/zsh-nvm
    yarn

    golang

    rbenv
    gem
EOBUNDLES

antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

test -e "${HOME}/.python" && source "${HOME}/.python"

antigen apply

eval "$(rbenv init -)"

source "$HOME/.aliases"
source "$HOME/.colors"
source "$HOME/.functions"

source "$(brew --prefix autoenv)/activate.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
