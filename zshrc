source "$HOME/.antigen/antigen.zsh"

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

DOTFILES="$HOME/.dotfiles"

antigen init .antigenrc

test -e "${HOME}/.python" && source "${HOME}/.python"

eval "$(rbenv init -)"

source "$HOME/.aliases"
source "$HOME/.colors"
source "$HOME/.functions"

source "$(brew --prefix autoenv)/activate.sh"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/heroku/autocomplete/zsh_setup" && test -f "$HEROKU_AC_ZSH_SETUP_PATH" && source "$HEROKU_AC_ZSH_SETUP_PATH";
