#!/usr/bin/env bash

export JAVA_HOME=/usr/local/java11
# delete gf alias in git
sed -i "s/alias gf='git fetch'//g" ~/.oh-my-zsh/plugins/git/git.plugin.zsh
