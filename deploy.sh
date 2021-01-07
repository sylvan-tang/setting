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

whoami="${HOME##*/}"

cp "$(pwd)/git/.gitconfig" ~/.gitconfig
sed -i '' "s/UserName/${user_name}/g" ~/.gitconfig
sed -i '' "s/YourEmailAddress/${email}/g" ~/.gitconfig

cp "$(pwd)/config/settings.xml" ~/.m2/settings.xml
sed -i '' "s/whoami/${whoami}/g" ~/.m2/settings.xml

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git config --add rebase.instructionFormat "[%an @ %ar] %s"

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "" >> ~/.zshrc
cat "$(pwd)/config/profile" >> ~/.zshrc
ln -sf "$(pwd)/config/bash_aliases" ~/.bash_aliases
ln -sf "$(pwd)/config/profile" ~/.profile
ln -sf "$(pwd)/config/tmux-open-session.sh" ~/.tmux-open-session.sh

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"
echo "Edit Custom VM Option, 然后最后一行加入-javaagent:这个文件的路径，比如-javaagent:/Users/sylvan/codes/setting/config/JetbrainsIdesCrack_5_2_KeepMyLic.jar，重启即可"

git config user.name sylvan
git config user.email sylvan2future@gmail.com
