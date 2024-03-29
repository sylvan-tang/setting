#!/bin/bash
set -e

which shfmt
if [[ $? != 0 ]]; then
  while true; do
    echo "install shfmt..."
    go install mvdan.cc/sh/v3/cmd/shfmt@latest
    if [[ $? = 0 ]]; then
      break
    fi
  done
fi
find . -name '*.sh' | grep -v ".history" | xargs -I {} shfmt -l -w -ci --indent=2 {}

git add .
