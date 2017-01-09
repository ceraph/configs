# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sisyphus/.zshrc'

autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
# End of lines added by compinstall

autoload -Uz promptinit
promptinit

bindkey -v # vi bindings

# Prompt
prompt off # turn off grml's prompt
PROMPT="> "

# Syntax
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export SYSTEMD_EDITOR="$VISUAL"

################################################################################

# Ranger
export TERMCMD=termite # usefull for opening programs in a new window
export RANGER_LOAD_DEFAULT_RC=False # load only configs in ~/

# Termite
source /etc/profile.d/vte.sh # Enables ctrl+shift+t for opening new terminal
