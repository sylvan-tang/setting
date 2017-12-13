#!/usr/bin/env bash
user_name=$1
password=$2
ln -sf $(pwd)/config/profile ~/.profile
ln -sf $(pwd)/config/bashrc ~/.bashrc
ln -sf $(pwd)/config/git-completion.bash ~/git-completion.bash
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig
ln -sf $(pwd)/sbt/repositories ~/.sbt/repositories
ln -sf $(pwd)/ssh/config ~/.ssh/config
ln -sf $(pwd)/azkaban/.azkabanrc ~/.azkabanrc

sed -i '' "s/LdapUserName/${user_name}/g" ivy2/.credentials
sed -i '' "s/LdapUserPassword/${password}/g" ivy2/.credentials
cp $(pwd)/ivy2/.credentials ~/.ivy2/.credentials

sed -i '' "s/LdapUserName/${user_name}/g" m2/settings.xml
sed -i '' "s/LdapUserPassword/${password}/g" m2/settings.xml
cp $(pwd)/m2/settings.xml ~/.m2/settings.xml

git add .
git stash