#!/usr/bin/env bash

# 修改参数时需要同时更新 README.md
user_name=$1
email=$2

for file_name in .bash_profile .bash_login; do
  if [[ -f "$HOME/$file_name" ]]; then
    echo "mv $HOME/$file_name to $HOME/$file_name.bak"
    mv "$HOME/$file_name" to "$HOME/$file_name.bak"
  fi
done

cp "$(pwd)/git/.gitconfig" ~/.gitconfig
sed -i '' "s/UserName/${user_name}/g" ~/.gitconfig
sed -i '' "s/YourEmailAddress/${email}/g" ~/.gitconfig

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "" >> ~/.zshrc
cat "$(pwd)/config/profile" >> ~/.zshrc
ln -sf "$(pwd)/config/bash_aliases" ~/.bash_aliases
ln -sf "$(pwd)/config/profile" ~/.profile
ln -sf "$(pwd)/config/tmux-open-session.sh" ~/.tmux-open-session.sh
ln -sf "$(pwd)/config/start-for-work.sh" ~/.start-for-work.sh

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"
