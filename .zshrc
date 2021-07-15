# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Locale
export LC_ALL=en_US.UTF-8
export PROMPT_EOL_MARK=''
export LANG="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export TERM=xterm
else
  export EDITOR='emacs'
fi

export ZSH="$HOME/.oh-my-zsh"

# Theme.
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Zprofile
[ -f $HOME/.zprofile ] && source $HOME/.zprofile

# Plugins (see ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  extract
  git
  git-extras
  zsh-autosuggestions
  zsh-syntax-highlighting
  yarn
  vi-mode
  fzf
  pass
  rust
  cargo
  python
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
