#█▓▒░ Ranger
#export TERMCMD=termite # usefull for opening programs in a new window
export RANGER_LOAD_DEFAULT_RC=False # load only configs in ~/

rg() {
    if [ -z "$RANGER_LEVEL" ]; then
        ranger
    else
        exit
    fi
}
