# Locale
export LC_ALL=en_US.UTF-8
export PROMPT_EOL_MARK=''
export LANG="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	  export EDITOR='vim'
else
    export EDITOR='emacs'
fi

export ZSH="$HOME/.oh-my-zsh"

# Theme.
ZSH_THEME="clean"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# Format of command execution time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="dd.mm.yyyy"
# Custom custom folder
# ZSH_CUSTOM="$HOME/dotfiles/zsh"

# Dircolors NORD
eval $(dircolors $HOME/.dir_colors)

# Zprofile
[ -f $HOME/.zprofile ] && source $HOME/.zprofile

# Plugins (see ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(extract git-extras zsh-syntax-highlighting python yarn vi-mode)
source $ZSH/oh-my-zsh.sh
