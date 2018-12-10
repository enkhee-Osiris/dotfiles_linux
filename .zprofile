if [[ -d $HOME/.node_modules ]]; then
  PATH="$HOME/.node_modules/bin:$PATH"
  export npm_config_prefix=$HOME/.node_modules
fi

if [[ -f /usr/bin/composer ]]; then
  PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

if [[ -f /usr/bin/java ]]; then
    default_java=`archlinux-java status | grep -i 'default' | awk {'print $1'}`
    export JAVA_HOME=/usr/lib/jvm/$default_java
fi

if [[ -d $HOME/Android/Sdk ]]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  [ -d $ANDROID_HOME/tools ] && PATH=$PATH:$ANDROID_HOME/tools
  [ -d $ANDROID_HOME/tools/bin ] && PATH=$PATH:$ANDROID_HOME/tools/bin
  [ -d $ANDROID_HOME/platform-tools ] && PATH=$PATH:$ANDROID_HOME/platform-tools
  [ -d $ANDROID_HOME/emulator ] && PATH=$PATH:$ANDROID_HOME/emulator
  if [[ -d $ANDROID_HOME/opencv ]]; then
    export OpenCV_ANDROID_HOME=$HOME/Android/Sdk/opencv
  fi
fi
