#!/bin/bash
#
# Aliases for bash
#

alias mongo-server='sudo mongod run --config /usr/local/etc/mongod.conf'
alias man='man -P less'
alias php_start='launchctl load ~/Library/LaunchAgents/homebrew-php.josegonzalez.php53.plist'
alias php_stop='launchctl stop homebrew-php.josegonzalez.php53'

# Check if we forget the colon on scp
function scp() {
    if [[ "$@" =~ : ]]; then
        /usr/bin/scp $@;
    else
        echo "You forgot the colon dumbass!";
    fi
}
