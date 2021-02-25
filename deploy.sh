#!/usr/bin/env bash
set -e

# 修改参数时需要同时更新 README.md
user_name=$1
email=$2
systemName=`uname`

for file_name in .bash_profile .bash_login; do
  if [[ -f "$HOME/$file_name" ]]; then
    mv "$HOME/$file_name" "$HOME/$file_name.bak"
  fi
done

whoami="${HOME##*/}"

cp "$(pwd)/git/.gitconfig" ~/.gitconfig
cp "$(pwd)/config/settings.xml" ~/.m2/settings.xml

if [[ "$systemName" = "Darwin" ]];then
  sed -i '' "s/UserName/${user_name}/g" ~/.gitconfig
  sed -i '' "s/YourEmailAddress/${email}/g" ~/.gitconfig
  sed -i '' "s/whoami/${whoami}/g" ~/.m2/settings.xml
else
  sed -i "s/UserName/${user_name}/g" ~/.gitconfig
  sed -i "s/YourEmailAddress/${email}/g" ~/.gitconfig
  sed -i "s/whoami/${whoami}/g" ~/.m2/settings.xml
fi

git config --add rebase.instructionFormat "[%an @ %ar] %s"

if [[ "$systemName" != "Darwin" ]];then
  linuxVersion=`awk -F= '/^NAME/{print $2}' /etc/os-release`
  case $linuxVersion in
    "CentOS Linux")
      dnf install zsh
    ;;
    *)
			echo "不支持本系统！"
	esac
fi
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc_bak
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "" >> ~/.zshrc
cat "$(pwd)/config/profile" >> ~/.zshrc
ln -sf "$(pwd)/config/bash_aliases" ~/.bash_aliases
ln -sf "$(pwd)/config/tmux-open-session.sh" ~/.tmux-open-session.sh

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"
echo "Edit Custom VM Option, 然后最后一行加入-javaagent:这个文件的路径，比如-javaagent:/Users/sylvan/codes/setting/config/JetbrainsIdesCrack_5_2_KeepMyLic.jar，重启即可"

git config user.name sylvan
git config user.email sylvan2future@gmail.com
