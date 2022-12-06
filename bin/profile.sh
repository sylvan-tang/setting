#!/usr/bin/env bash

export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8

if [[ ! -d "/tmp/go" ]]; then
    mkdir /tmp/go
fi

if [ -f ~/.bash-aliases ]; then
    . ~/.bash-aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

GO_PATH=$(whereis go | awk '{print $2}')
# set go PATH so it includes user's private bin if it exists
if [ -d "$GO_PATH" ] ; then
    export PATH="$GO_PATH/bin:$PATH"
fi
GO_ENV_PATH=$(go env | grep GOPATH | cut -d \" -f 2)
if [ -d "$GO_PATH" ] ; then
    export PATH="$GO_ENV_PATH/bin:$PATH"
fi

#   Change Prompt
#   ------------------------------------------------------------
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

day_of_week=$(date +%w)
while true; do 
  docker ps
  if [ $? != 0 ]; then
    echo "Wait for docker daemon start!"
    sleep 60
    continue
  fi
  if [ $day_of_week -lt 5 ];then
    if [ -f ~/.run_docker_prune ]; then
      echo "Wait for docker ready!"
      sleep 120
      docker system prune --force
      docker system prune --volumes --force
      rm ~/.run_docker_prune
    fi
  else
    touch ~/.run_docker_prune
  fi
  break
done

. "$HOME/.cargo/env"

source "$HOME/.cargo/env"

if [[ ! -d ~/codes ]]; then
  mkdir ~/codes # for working spaces, do not remove this
fi
cd ~/codes
