source "$HOME/.antigen/antigen.zsh"

export EDITOR="vim"
export GOPATH="$HOME/Developer/go"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$GOPATH/bin"

# Avoid Homebrew sending data to Google Analytics
export HOMEBREW_NO_ANALYTICS=1

DOTFILES="$HOME/.dotfiles"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search
    arialdomartini/oh-my-git
    git
    rbenv
EOBUNDLES

antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

test -e "${HOME}/.python" && source "${HOME}/.python"

antigen apply

eval "$(rbenv init -)"

source "$HOME/.aliases"
source "$HOME/.colors"
source "$HOME/.functions"

# NVM
export NVM_DIR="/Users/rcmachado/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
