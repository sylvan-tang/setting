#!/usr/bin/env bash
set -xe

for dir_name in __pypackages__ __pycache__; do
  find ~/codes/ -type d -name $dir_name -print -exec rm -rf {} +
done

for file_suffix in pyc pyo; do
  find ~/codes/ -name *.$file_suffix -type f -print -delete
done
