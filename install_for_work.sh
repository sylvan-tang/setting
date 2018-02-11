#!/usr/bin/env bash

sudo easy_install pip

brew tap zhihu/tools git@git.in.zhihu.com:infrastructure/homebrew-tools.git
brew install zhihu/tools/zhihu-buildout

sudo pip install python-gflags==2.0.0 --user -U

brew install protobuf

sudo pip install zhihu-protobuf==2.6.1 -i https://mirror.in.zhihu.com/simple
