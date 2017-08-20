for config (~/.zsh/*.zsh) source $config

[[ $TERM != "screen" ]] && exec tmux
