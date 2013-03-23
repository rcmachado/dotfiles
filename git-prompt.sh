#!/bin/bash
#
# Customize PS1 prompt with the name of current git branch
#
# Also indicates when the code is "dirty" (has local modifications).
#

function parse_git_dirty {
    [[ $(git status --porcelain 2> /dev/null) != "" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\[\e[36;1m\]\w\[\e[0m\] $(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]]")\n\$ \[\e[0m\]'
