#!/bin/bash
#
# Aliases for bash
#

alias mongo-server='sudo mongod run --config /usr/local/etc/mongod.conf'
alias man='man -P less'

# Check if we forget the colon on scp
function scp() {
    if [[ "$@" =~ : ]]; then
        /usr/bin/scp $@;
    else
        echo "You forgot the colon dumbass!";
    fi
}
