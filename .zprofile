if [[ -d $HOME/dotfiles_linux/bin ]]; then
  PATH="$HOME/dotfiles_linux/bin:$PATH"
fi

if [[ -d $HOME/go/bin ]]; then
  PATH="$HOME/go/bin:$PATH"
fi

if [[ -d $HOME/.local/bin ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [[ -f /usr/bin/npm ]]; then
  export npm_config_prefix=$HOME/.node_modules

  if [[ -d $HOME/.node_modules ]]
  then
    PATH="$HOME/.node_modules/bin:$PATH"
  else
    mkdir -p "$HOME/.node_modules"
    PATH="$HOME/.node_modules/bin:$PATH"
    export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
  fi
fi

if [[ -d $HOME/.cargo ]]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -f /usr/bin/composer ]]; then
  PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [[ -d /usr/local/Cellar/radare2/3.6.0/bin ]]; then
  PATH="/usr/local/Cellar/radare2/3.6.0/bin:$PATH"
fi

if [[ -d $HOME/.yarn ]];then
  PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

if [[ -d $HOME/.cargo ]];then
  PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

if command -v archlinux-java &>/dev/null; then
  if [[ -f /usr/bin/java ]]; then
    default_java=`archlinux-java status | grep -i 'default' | awk {'print $1'}`
    export JAVA_HOME=/usr/lib/jvm/$default_java
  fi
fi

if [[ -f $HOME/.node_modules/bin/phantomjs ]]; then
  export PHANTOMJS_BIN=$HOME/.node_modules/bin/phantomjs
fi

if [[ -d $HOME/.gem/ruby ]]; then
  RUBY_VERSION="2.6.0"
  PATH="$HOME/.gem/ruby/$RUBY_VERSION/bin:$PATH"
fi

if [[ -d $HOME/Android/Sdk ]]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  # [ -d $ANDROID_HOME/tools ] && PATH=$PATH:$ANDROID_HOME/tools
  # [ -d $ANDROID_HOME/tools/bin ] && PATH=$PATH:$ANDROID_HOME/tools/bin
  [ -d $ANDROID_HOME/platform-tools ] && PATH=$PATH:$ANDROID_HOME/platform-tools
  [ -d $ANDROID_HOME/emulator ] && PATH=$PATH:$ANDROID_HOME/emulator
  if [[ -d $HOME/Android/ndk ]]; then
    export ANDROID_NDK=$HOME/Android/ndk
    export ANDROID_NDK_HOME=$HOME/Android/ndk
  fi
  if [[ -d $ANDROID_HOME/opencv ]]; then
    export OpenCV_ANDROID_HOME=$HOME/Android/Sdk/opencv
  fi
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

if [[ -d $HOME/.emacs.d/bin ]]; then
  PATH="$HOME/.emacs.d/bin:$PATH"
fi

if command -v rustc &>/dev/null; then
  if [[ -d $(rustc --print sysroot)/lib/rustlib/src/rust/src ]]; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
  fi
fi

export PATH="$PATH"
