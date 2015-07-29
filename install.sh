#!/bin/bash
#
# Install all the dotfiles on system
#
# Uses rcm (https://github.com/thoughtbot/rcm)
#

if [ `uname` == "Darwin" ]
then
    OS="osx"
else
    OS="unknown"
fi

. rcrc

function install_rcm {
    case "$OS" in
        osx)
            brew tap thoughtbot/formulae
            brew install rcm
            ;;
        *)
            echo "OS $OS not supported; aborting;" && exit 1
            ;;
    esac
}

function has_rcm {
    [ `which rcup` ]
}

function run_rcup {
    cd "$HOME" && rcup -t $OS -x ${EXCLUDES// / -x }
}

function install_antigen() {
    git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen"
}

function has_antigen() {
    [ -d "$HOME/.antigen" ]
}

has_rcm || install_rcm
has_antigen || install_antigen
run_rcup
