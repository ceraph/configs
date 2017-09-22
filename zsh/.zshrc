for config (~/.zsh/*.zsh) source $config

if command -v tmux>/dev/null; then
	[[ -z $TMUX ]] && exec tmux
fi
