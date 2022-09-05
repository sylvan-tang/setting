#!/usr/bin/env bash
set -x

which dnf
if [[ $? != 0 ]] ; then
  yum install dnf
fi

dnf install bash-completion

which git
if [[ $? != 0 ]] ; then
  dnf install git
fi

which tmux
if [[ $? != 0 ]] ; then
  dnf install tmux
fi

which ipython
if [[ $? != 0 ]] ; then
  dnf install ipython
fi

mvn -v
if [[ $? != 0 ]] ; then
  dnf install maven
fi

which java
if [[ $? != 0 ]] ; then
  yum install java-1.11.0-openjdk
fi

which docker-compose
if [[ $? != 0 ]] ; then
  dnf install docker-compose
fi

which zsh
if [[ $? != 0 ]] ; then
  dnf install zsh
  chsh -s /bin/zsh root
fi
