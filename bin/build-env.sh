#!/usr/bin/env bash

GIT_USER=user
if [ $1 ]; then
  GIT_USER=$1
else
  echo "Need input your git user name"; exit 1;
fi

GIT_EMAIL=$2
if [ $2 ]; then
  GIT_EMAIL=$2
else
  echo "Need input your git email address"; exit 1;
fi

SYSTEM_NAME=`uname`
if [[ "$SYSTEM_NAME" = "Linux" ]];then
  SYSTEM_NAME=$( echo `awk -F= '/^NAME/{print $2}' /etc/os-release` | tr -d '"' | awk '{print $1}' )
fi
SYSTEM_NAME=$( echo "$SYSTEM_NAME" | awk '{print tolower($0)}' )

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

ZSH_STYLE=robbyrussell
case $SYSTEM_NAME in
  centos)
    ZSH_STYLE=cloud
  ;;
  darwin)
    ZSH_STYLE=darkblood
  ;;
  *)
    echo "不支持本系统！"
    exit 1
esac
