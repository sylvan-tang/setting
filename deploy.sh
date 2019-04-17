#!/usr/bin/env bash
user_name=`whoami`
email=$1

mkdir ~/codes

cp $(pwd)/git/.gitconfig ~/.gitconfig
sed -i '' "s/UserName/${user_name}/g" ~/.gitconfig
sed -i '' "s/YourEmailAddress/${email}/g" ~/.gitconfig

ln -sf $(pwd)/config/git-completion.bash ~/git-completion.bash
ln -sf $(pwd)/config/bash_aliases ~/.bash_aliases
ln -sf $(pwd)/config/bashrc ~/.bashrc
ln -sf $(pwd)/config/profile ~/.profile

mkdir ~/.sbt
ln -sf $(pwd)/sbt/repositories ~/.sbt/repositories

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"
