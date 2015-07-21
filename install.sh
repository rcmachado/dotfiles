#!/bin/bash
#
# Install all the dotfiles on system
#
# Uses rcm (https://github.com/thoughtbot/rcm)
#

WHICH_OS=`uname`

function install_rcm {
    case "$WHICH_OS" in
        Darwin)
            brew tap thoughtbot/formulae
            brew install rcm
            ;;
        *)
            echo "OS $WHICH_OS not supported; aborting;" && exit 1
            ;;
    esac
}

function has_rcm {
    [ ! `which rcm` ]
}

function install_antigen() {
    git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen"
}

function has_antigen() {
    [ -d "$HOME/.antigen" ]
}

has_rcm || install_rcm
has_antigen || install_antigen
