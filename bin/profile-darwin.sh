export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# set PATH so it includes user's private bin if it exists
if [ -d "/usr/local/go/bin" ] ; then
    export PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "/Library/Frameworks/Python.framework/Versions/3.8/bin" ] ; then
    export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH"
fi
