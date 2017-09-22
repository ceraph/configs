alias ls="ls -h --group-directories-first --color=auto"
alias l="ls -hl --group-directories-first --color=auto"
alias la="ls -hla --group-directories-first --color=auto"
alias ..="cd .."

alias tree="tree -C"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gl="git log"

alias cp="cp -i" # Confirm before overwriting something
alias df='df -h' # Human-readable sizes

alias grep="grep --color"

# CULUMNS changes with resinging of the shell window. But man should always
# display 80 columns for readability.
alias man="COLUMNS=80 man"
