#!/bin/bash
#
# Aliases for bash
#

alias mongo-server='sudo mongod run --config /usr/local/etc/mongod.conf'
alias man='man -P less'
alias php-start='launchctl load ~/Library/LaunchAgents/homebrew-php.josegonzalez.php53.plist'
alias php-stop='launchctl stop homebrew-php.josegonzalez.php53'
alias php-restart="php-stop && sleep 0.2 && php-start"

# Check if we forget the colon on scp
function scp() {
    if [[ "$@" =~ : ]]; then
        /usr/bin/scp $@;
    else
        echo "You forgot the colon dumbass!";
    fi
}
