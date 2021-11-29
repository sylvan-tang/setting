#!/usr/bin/env bash
set -xe

PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $PROJECT_PATH/bin/build-env.sh $1 $2 $3 $4

sh $PROJECT_PATH/bin/backup.sh
sh $PROJECT_PATH/bin/install-tools-$SYSTEM_NAME.sh

ln -sf "$PROJECT_PATH/config/bash-aliases" ~/.bash-aliases
ln -sf "$PROJECT_PATH/config/tmux-open-session.sh" ~/.tmux-open-session.sh
ln -sf "$PROJECT_PATH/bin/profile.sh" ~/.profile.sh
ln -sf "$PROJECT_PATH/bin/profile-$SYSTEM_NAME.sh" ~/.profile-$SYSTEM_NAME.sh
ln -sf "$PROJECT_PATH/bin/install-orc8.sh" ~/.install-orc8.sh
ln -sf "$PROJECT_PATH/ssh/config" ~/.ssh/config

if [[ -f "$HOME/.pip/pip.conf" ]]; then
  mv "$HOME/.pip/pip.conf" "$HOME/.pip/pip.conf.bak"
fi
ln -sf "$PROJECT_PATH/conf/pip.conf" ~/.pip/pip.conf

cp "$PROJECT_PATH/config/oci8.pc" $HOME/.oci8.pc
sed -i '' "s|HOME|${HOME}|g" $HOME/.oci8.pc

if [[ ! -d "$HOME/.oh-my-zsh/" ]]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "" >> ~/.zshrc
echo "source ~/.profile.sh" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "source ~/.profile-$SYSTEM_NAME.sh" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "source ~/.install-orc8.sh" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "unsetopt extendedglob" >> ~/.zshrc
echo "" >> ~/.zshrc
echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc
echo "" >> ~/.zshrc
echo 'export CPPFLAGS="-I/usr/local/opt/openjdk/include"' >> ~/.zshrc
echo "" >> ~/.zshrc
echo 'export GROOVY_HOME=/usr/local/opt/groovy/libexec' >> ~/.zshrc
echo "" >> ~/.zshrc

sh $PROJECT_PATH/bin/setting-env-$SYSTEM_NAME.sh $PROJECT_PATH $GIT_USER $GIT_EMAIL $ZSH_STYLE $REPO_USER $REPO_PASSWORD

echo "If you are init your MacBook, please change your root password by 'sudo passwd root'"

git config user.name sylvan
git config user.email sylvan2future@gmail.com
git config pull.rebase true
