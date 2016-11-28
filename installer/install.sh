#!/bin/bash
#
# Setup all the things
#

RUBY_BIN=/usr/bin/ruby
BREW_BIN=/usr/local/bin/brew
PYENV_BIN="$HOME/.pyenv/bin/pyenv"
PYTHON_BIN="$HOME/.pyenv/shims/python"
RBENV_BIN="/usr/local/bin/rbenv"
GEM_BIN="/$HOME/.rbenv/shims/gem"

export PYENV_ROOT="$HOME/.pyenv"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

setup_dirs() {
    mkdir -p "$HOME/Developer"
}

setup_zsh() {
    local shell_bin=/usr/local/bin/zsh
    if grep --invert-match --fixed-strings --line-regexp --quiet "$shell_bin" /etc/shells; then
        echo "$shell_bin" | sudo tee -a /etc/shells
    fi
    chsh -s "$shell_bin" "$USER"
}

brew_setup() {
    which "$BREW_BIN" > /dev/null 2> /dev/null
    if [ $? -ne 0 ]; then
        echo Installing Homebrew and Caskroom
        "$RUBY_BIN" -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo Homebrew already installed at "$BREW_BIN"
    fi
}

brew_install_packages() {
    $BREW_BIN tap thoughtbot/formulae
    $BREW_BIN update
    $BREW_BIN install editorconfig elixir git git-fresh go jq mysql node rcm rbenv shellcheck the_silver_searcher zsh
    $BREW_BIN install --HEAD vim
    $BREW_BIN install --with-nghttp2 --with-openssl curl
    $BREW_BIN link curl --force
    $BREW_BIN cask install caffeine divvy dropbox hipchat iterm2 java kindle sequel-pro slack spotify vagrant
    $BREW_BIN services start mysql
    gem install i2cssh
}

install_antigen() {
    [ -d "$HOME/.antigen" ] || \
        git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen" && \
        echo "Antigen already installed, skipping" && \
        return
}

pyenv_setup() {
    if [ ! -x "$PYENV_BIN" ]; then
        echo Installing pyenv
        curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    fi
}

setup_dotfiles() {
    if [ ! -d "$HOME/Developer/rcmachado/dotfiles" ]; then
        git clone git@github.com:rcmachado/dotfiles.git "$HOME/Developer/rcmachado/dotfiles"
    fi

    ln -snf "$HOME/Developer/rcmachado/dotfiles" "$HOME/.dotfiles"

    source "$HOME/.dotfiles/rcrc"
    cd "$HOME" && rcup -t "osx" -t "python" -x "${EXCLUDES// / -x }"
}

setup_vimfiles() {
    if [ ! -d "$HOME/Developer/rcmachado/vimfiles" ]; then
        git clone git@github.com:rcmachado/vimfiles.git "$HOME/Developer/rcmachado/vimfiles"
    fi

    rm -rf "$HOME/.vim"
    ln -snf "$HOME/Developer/rcmachado/vimfiles" "$HOME/.vim"
    ln -snf "$HOME/Developer/rcmachado/vimfiles/vimrc" "$HOME/.vimrc"

    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
        git clone https://github.com/gmarik/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
    fi
    vim +PluginInstall +qall
}

generate_ssh_key() {
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        local COMMENT="$USER@$(hostname -s)";

        echo "Generating SSH key"
        ssh-keygen -t rsa -N "" -f "$HOME/.ssh/id_rsa" -C "$COMMENT"
        # TODO: call GitHub/GitLab API to add the new key?
    fi
}

install_firefox_developer_edition() {
    local VERSION=52.0a2
    local FIREFOX_PATH=/Applications/FirefoxDeveloperEdition.app/Contents/MacOS/firefox

    if [ ! -x "$FIREFOX_PATH" ]; then
        echo Installing Firefox Developer Edition
        curl -o /tmp/firefox.dmg https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora/firefox-$VERSION.en-US.mac.dmg
        hdiutil mount /tmp/firefox.dmg
        cp -a /Volumes/FirefoxDeveloperEdition/FirefoxDeveloperEdition.app /Applications
        hdiutil unmount /Volumes/FirefoxDeveloperEdition
        rm -f /tmp/firefox.dmg
    else
        echo Firefox Developer Edition already installed, skipping
    fi
}

install_python() {
    CFLAGS="-I$("$BREW_BIN" --prefix openssl)/include"
    LDFLAGS="-L$("$BREW_BIN" --prefix openssl)/lib"

    "$PYENV_BIN" install --skip-existing 3.5.2
    PYENV_VERSION=3.5.2 "$PYTHON_BIN" -m pip install -U pip setuptools
    "$PYENV_BIN" install --skip-existing 3.4.5
    PYENV_VERSION=3.4.5 "$PYTHON_BIN" -m pip install -U pip setuptools
    "$PYENV_BIN" install --skip-existing 3.3.6
    PYENV_VERSION=3.3.6 "$PYTHON_BIN" -m pip install -U pip setuptools
    "$PYENV_BIN" install --skip-existing 2.7.12
    PYENV_VERSION=2.7.12 "$PYTHON_BIN" -m pip install -U pip setuptools
}

install_ruby() {
    "$RBENV_BIN" install --skip-existing 2.3.1
    RBENV_VERSION=2.3.1 "$GEM_BIN" install bundler
}

install_node_libs() {
    npm install --global npm
    npm install --global grunt-cli bower bower-installer uglifyjs
}

install_custom_font() {
    local CURRENT_DIR

    CURRENT_DIR=$(dirname $0)

    if [ ! -f "$HOME/Library/Fonts/SourceCodePro+Powerline+Awesome+Regular.ttf" ]; then
        echo Installing patched font SourceCodePro
        osascript "$CURRENT_DIR/install-font.scpt" "$CURRENT_DIR/SourceCodePro+Powerline+Awesome+Regular.ttf"
    fi
}

setup_dirs
brew_setup
brew_install_packages
setup_zsh
install_antigen
pyenv_setup
install_firefox_developer_edition
generate_ssh_key
setup_dotfiles
setup_vimfiles
install_python
install_ruby
install_node_libs
install_custom_font
