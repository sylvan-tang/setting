#!/usr/bin/env bash

export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8

if [ -f ~/.bash-aliases ]; then
    . ~/.bash-aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

#   Change Prompt
#   ------------------------------------------------------------
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
