#!/usr/bin/env bash
set -xe

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $PROJECT_PATH/bin/build-env.sh $1 $2

sh $PROJECT_PATH/bin/backup.sh
sh $PROJECT_PATH/bin/install-tools-$SYSTEM_NAME.sh

ln -sf "$PROJECT_PATH/config/bash-aliases" ~/.bash-aliases
ln -sf "$PROJECT_PATH/config/tmux-open-session.sh" ~/.tmux-open-session.sh
ln -sf "$PROJECT_PATH/bin/profile.sh" ~/.profile.sh
ln -sf "$PROJECT_PATH/bin/profile-$SYSTEM_NAME.sh" ~/.profile-$SYSTEM_NAME.sh
ln -sf "$PROJECT_PATH/ssh/config" ~/.ssh/config

if [[ ! -d "$HOME/.oh-my-zsh/" ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "" >> ~/.zshrc
echo "source ~/.profile.sh" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "source ~/.profile-$SYSTEM_NAME.sh" >> ~/.zshrc
echo "" >> ~/.zshrc

sh $PROJECT_PATH/bin/setting-env-$SYSTEM_NAME.sh $PROJECT_PATH $GIT_USER $GIT_EMAIL $ZSH_STYLE

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"

git config user.name sylvan
git config user.email sylvan2future@gmail.com
git config pull.rebase true
