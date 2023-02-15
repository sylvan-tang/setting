#!/usr/bin/env bash
set -xe

for file_name in .bash_profile .bash_login .bashrc .tcshrc .cshrc .zshrc .ssh/config; do
	if [[ -f "$HOME/$file_name" ]]; then
		mv "$HOME/$file_name" "$HOME/$file_name.bak"
	fi
done
