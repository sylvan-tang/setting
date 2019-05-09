#!/usr/bin/env bash

branch_name=`git branch | grep '\*' | awk '{print $2}'`
git push origin $branch_name:refs/for/master
