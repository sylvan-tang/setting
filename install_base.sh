#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
brew install git bash-completion

brew install tmux
brew install ipython

sudo easy_install pip

mkdir ~/codes # for working spaces, do not remove this
