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
    [ `which rcm` ]
}

has_rcm && install_rcm
