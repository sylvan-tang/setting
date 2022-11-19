#!/usr/bin/env bash
set -xe
if [[ ! -d "/tmp/go" ]]; then
    mkdir /tmp/go
fi
# setting env for go
go env -w GONOPROXY=http://goproxy.cn
go env -w GONOSUMDB=off
go env -w GOPRIVATE=""
go env -w GOPROXY=http://goproxy.cn,direct
go env -w GOSUMDB=off
go env -w GOTMPDIR=/tmp/go

# install base tools for go
go install -v golang.org/x/tools/gopls@latest
go install -v github.com/ramya-rao-a/go-outline@v0.0.0-20210608161538-9736a4bde949
go install -v golang.org/x/tools/cmd/guru@latest
go install golang.org/x/tools/gopls@latest
