source "$HOME/.antigen/antigen.zsh"

# Avoid Homebrew sending data to Google Analytics
export HOMEBREW_NO_ANALYTICS=1

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

# NVM
export NVM_DIR="/Users/rcmachado/.nvm"
export NVM_LAZY_LOAD=true

DOTFILES="$HOME/.dotfiles"

antigen init .antigenrc

test -e "${HOME}/.python" && source "${HOME}/.python"

eval "$(rbenv init -)"

source "$HOME/.aliases"
source "$HOME/.colors"
source "$HOME/.functions"

source "$(brew --prefix autoenv)/activate.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
