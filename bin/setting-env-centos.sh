#!/usr/bin/env bash
set -xe

PROJECT_PATH=$1
GIT_USER=$2
GIT_EMAIL=$3
ZSH_STYLE=$4

cp "$PROJECT_PATH/git/.gitconfig" ~/.gitconfig
cp "$PROJECT_PATH/config/settings.xml" ~/.m2/settings.xml

sed -i "s/UserName/${GIT_USER}/g" ~/.gitconfig
sed -i "s/YourEmailAddress/${GIT_EMAIL}/g" ~/.gitconfig
sed -i "s#HOME#${HOME}#g" ~/.m2/settings.xml

git config --add rebase.instructionFormat "[%an @ %ar] %s"

sed -i "s/robbyrussell/${ZSH_STYLE}/g"  ~/.zshrc