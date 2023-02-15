export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home

if [ -d "/Library/Frameworks/Python.framework/Versions/3.8/bin" ]; then
  export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH"
fi

if [ -d "/usr/local/opt/mysql-client/bin" ]; then
  export PATH="/usr/local/opt/mysql-client/bin:$PATH"
fi

# delete gf alias in git
sed -i '' "s/alias gf='git fetch'//g" ~/.oh-my-zsh/plugins/git/git.plugin.zsh
