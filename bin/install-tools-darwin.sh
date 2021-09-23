#!/usr/bin/env bash
set -x

which brew
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install bash-completion

which git
if [[ $? != 0 ]] ; then
  brew install git
fi

which tmux
if [[ $? != 0 ]] ; then
  brew install tmux
fi

which ipython
if [[ $? != 0 ]] ; then
  brew install ipython
fi

#mkdir ~/codes # for working spaces, do not remove this

mvn -v
if [[ $? != 0 ]] ; then
  brew install maven
fi

which java
if [[ $? != 0 ]] ; then
  brew tap AdoptOpenJDK/openjdk
  brew cask install adoptopenjdk8
fi

which docker-compose
if [[ $? != 0 ]] ; then
  brew install docker-compose
fi

which zsh
if [[ $? != 0 ]] ; then
  brew install zsh
  chsh -s /bin/zsh root
fi

which groovy
if [[ $? != 0 ]] ; then
  brew install groovy
  sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi