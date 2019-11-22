#!/usr/bin/env bash

# start for lakshmi
function start_docker() {
  name=$1
  if [[ -z $(docker ps | grep "$name") ]]; then
    docker start "$name"
    ssh-add
  fi
}
start_docker mysql
start_docker redis
