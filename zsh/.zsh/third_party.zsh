#█▓▒░ Ranger
# Pressing "r t" runs the selected file in the defined shell.
export TERMCMD=alacritty 

export RANGER_LOAD_DEFAULT_RC=False # load only configs in ~/

rg() {
    if [ -z "$RANGER_LEVEL" ]; then
        ranger
    else
        exit
    fi
}
