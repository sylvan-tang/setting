#!/usr/bin/env bash

which dnf
if [[ $? != 0 ]] ; then
  while true; do
    echo "install dnf..."
    yum install dnf
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

dnf install bash-completion

which wget
if [[ $? != 0 ]] ; then
  while true; do
    echo "install wget..."
    dnf install wget
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which git
if [[ $? != 0 ]] ; then
  while true; do
    echo "install git..."
    dnf install git
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which tmux
if [[ $? != 0 ]] ; then
  while true; do
    echo "install tmux..."
    dnf install tmux
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which ipython
if [[ $? != 0 ]] ; then
  while true; do
    echo "install ipython..."
    dnf install ipython
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

mvn -v
if [[ $? != 0 ]] ; then
  while true; do
    echo "install maven..."
    dnf install maven
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which java
if [[ $? != 0 ]] ; then
  while true; do
    echo "install java 1.11.0..."
    yum install java-1.11.0-openjdk
    if [[ $? = 0 ]] ; then
      break
    fi
  done
  
fi

which docker-compose
if [[ $? != 0 ]] ; then
  while true; do
    echo "install docker-compose..."
    dnf install docker-compose
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which zsh
if [[ $? != 0 ]] ; then
  while true; do
    echo "install zsh..."
    dnf install zsh
    chsh -s /bin/zsh root
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which rustup
if [[ $? != 0 ]] ; then
  while true; do
    echo "install rustup..."
    curl https://sh.rustup.rs -sSf | sh
    source "$HOME/.cargo/env"
    rustup component add rustfmt
    if [[ $? = 0 ]] ; then
      break
    fi
  done
  
fi
