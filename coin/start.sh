#!/usr/bin/env bash
set -ex

export COIN_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $COIN_PATH

  if [[ ! -d $COIN_PATH/programmingbitcoin ]]; then
    git clone https://github.com/jimmysong/programmingbitcoin
  fi

  docker-compose up -d
popd
