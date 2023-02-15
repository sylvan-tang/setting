#!/usr/bin/env bash
set -ex

export COIN_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120

pushd $COIN_PATH

if [[ ! -d $COIN_PATH/programmingbitcoin ]]; then
  git clone https://github.com/jimmysong/programmingbitcoin
fi

docker-compose up -d
popd
