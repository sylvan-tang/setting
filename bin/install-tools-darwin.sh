#!/usr/bin/:env bash

cat /etc/hosts | grep raw.githubusercontent.com
if [[ $? != 0 ]] ; then
  echo "'199.232.96.133  raw.githubusercontent.com' should add into /etc/hosts"
  exit 1
fi
cat /etc/hosts | grep kubernetes.docker.internal
if [[ $? != 0 ]] ; then
  echo "'127.0.0.1       kubernetes.docker.internal' should add into /etc/hosts"
  exit 1
fi

which brew
if [[ $? != 0 ]] ; then
  while true; do
    echo "install brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

brew install bash-completion

which wget
if [[ $? != 0 ]] ; then
  while true; do
    echo "install wget..."
    brew install wget
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which git
if [[ $? != 0 ]] ; then
  while true; do
    echo "install git..."
    brew install git
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which tmux
if [[ $? != 0 ]] ; then
  while true; do
    echo "install tmux..."
    brew install tmux
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi


which ipython
if [[ $? != 0 ]] ; then
  while true; do
    echo "install ipython..."
    brew install ipython
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

mvn -v
if [[ $? != 0 ]] ; then
  while true; do
    echo "install maven..."
    brew install maven
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which java
if [[ $? != 0 ]] ; then
  while true; do
    echo "install java 11..."
    brew tap AdoptOpenJDK/openjdk
    brew cask install adoptopenjdk11
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which docker-compose
if [[ $? != 0 ]] ; then
  while true; do
    echo "install docker-compose..."
    brew install docker-compose
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which zsh
if [[ $? != 0 ]] ; then
  while true; do
    echo "install zsh..."
    brew install zsh
    chsh -s /bin/zsh root
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which groovy
if [[ $? != 0 ]] ; then
  while true; do
    echo "install groovy..."
    brew install groovy
    sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which pkg-config
if [[ $? != 0 ]] ; then
  while true; do
    echo "install pkg-config..."
    brew install pkg-config
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

which node
if [[ $? != 0 ]] ; then
  while true; do
    echo "install node..."
    brew install node
    npm install -g solc
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which solidity
if [[ $? != 0 ]] ; then
  while true; do
    echo "install solidity..."
    brew tap ethereum/ethereum
    brew install solidity
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi

which protobuf
if [[ $? != 0 ]] ; then
  while true; do
    echo "install protobuf..."
    brew install protobuf
    if [[ $? = 0 ]] ; then
      break
    fi
  done
fi
