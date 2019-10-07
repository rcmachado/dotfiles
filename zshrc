SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  pyenv         # Pyenv section
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)

source "$HOME/.antigen/antigen.zsh"

[ -f ~/.private-env ] && source ~/.private-env

DOTFILES="$HOME/.dotfiles"

export NVM_LAZY_LOAD=true

antigen init .antigenrc

export PYENV_ROOT="/usr/local/Cellar/pyenv/1.2.13_1"

eval "$(${PYENV_ROOT}/bin/pyenv init - zsh --no-rehash)"

source "$HOME/.aliases"
source "$HOME/.colors"
source "$HOME/.functions"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
