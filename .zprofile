PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

if [[ -d $HOME/Android/Sdk ]]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  PATH=$PATH:$ANDROID_HOME/tools
  PATH=$PATH:$ANDROID_HOME/tools/bin
  PATH=$PATH:$ANDROID_HOME/platform-tools
  PATH=$PATH:$ANDROID_HOME/emulator
fi
