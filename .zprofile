if [[ -d $HOME/.node_modules ]]; then
  PATH="$HOME/.node_modules/bin:$PATH"
  export npm_config_prefix=$HOME/.node_modules
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

if [[ -d $HOME/Android/Sdk ]]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  [ -d $ANDROID_HOME/tools ] && PATH=$PATH:$ANDROID_HOME/tools
  [ -d $ANDROID_HOME/tools/bin ] && PATH=$PATH:$ANDROID_HOME/tools/bin
  [ -d $ANDROID_HOME/platform-tools ] && PATH=$PATH:$ANDROID_HOME/platform-tools
  [ -d $ANDROID_HOME/emulator ] && PATH=$PATH:$ANDROID_HOME/emulator
  if [[ -d $ANDROID_HOME/opencv ]]; then
    export CMAKE_MODULE_PATH=$HOME/Android/Sdk/opencv
    export OpenCV_DIR=$HOME/Android/Sdk/opencv/native/jni
    [ -d $ANDROID_HOME/opencv ] && PATH=$PATH:$ANDROID_HOME/opencv
    [ -d $ANDROID_HOME/opencv/native ] && PATH=$PATH:$ANDROID_HOME/opencv/native
  fi
fi
