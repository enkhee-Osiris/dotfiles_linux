PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
