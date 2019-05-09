#!/usr/bin/env bash

branch_name=`git branch | grep '\*' | awk '{print $2}'`
git push origin :$branch_name
git push origin $branch_name:$branch_name -f
