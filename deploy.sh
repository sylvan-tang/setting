#!/usr/bin/env bash
user_name=`whoami`
email=$1
rm ~/.bash_profile
rm ~/.bash_login

cp $(pwd)/git/.gitconfig ~/.gitconfig
sed -i '' "s/UserName/${user_name}/g" ~/.gitconfig
sed -i '' "s/YourEmailAddress/${email}/g" ~/.gitconfig

ln -sf $(pwd)/config/bash_aliases ~/.bash_aliases
ln -sf $(pwd)/config/bashrc ~/.bashrc
ln -sf $(pwd)/config/profile ~/.profile
ln -sf $(pwd)/config/tmux-open-session.sh ~/.tmux-open-session.sh
ln -sf $(pwd)/config/push_to_baidu_current_force.sh ~/.push_to_baidu_current_force.sh
ln -sf $(pwd)/config/push_to_baidu_master.sh ~/.push_to_baidu_master.sh

mkdir ~/.sbt
ln -sf $(pwd)/sbt/repositories ~/.sbt/repositories

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"
