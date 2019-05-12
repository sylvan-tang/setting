#!/usr/bin/env bash

# 修改参数时需要同时更新 README.md
user_name=$1
password=$2
email=$3
rm ~/.bash_profile
rm ~/.bash_login

cp $(pwd)/git/.gitconfig ~/.gitconfig
sed -i '' "s/UserName/${user_name}/g" ~/.gitconfig
sed -i '' "s/YourEmailAddress/${email}/g" ~/.gitconfig

cp $(pwd)/m2/settings.xml ~/.m2/settings.xml
sed -i '' "s/UserName/${user_name}/g" ~/.m2/settings.xml
sed -i '' "s/Password/${password}/g" ~/.m2/settings.xml

ln -sf $(pwd)/config/bash_aliases ~/.bash_aliases
ln -sf $(pwd)/config/bashrc ~/.bashrc
ln -sf $(pwd)/config/profile ~/.profile
ln -sf $(pwd)/config/tmux-open-session.sh ~/.tmux-open-session.sh

mkdir ~/.sbt
ln -sf $(pwd)/sbt/repositories ~/.sbt/repositories

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"
