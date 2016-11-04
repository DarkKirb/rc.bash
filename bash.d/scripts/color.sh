deps() {
    echo "path"
}
. $HOME/.bash.d/functions/dircolors.sh
startfile() {
    which dircolors
    if [[ $? = 0 ]]; then
        eval $(dircolors)
    else
        _dircolors
    fi
    if [[ `uname` == 'Linux' ]]; then
        echo "alias ls='ls --color=auto'" >> $HOME/.bash.conf
    else
        #assume we're not having gnu ls
        echo "alias ls='ls -G'" >> $HOME/.bash.conf
    fi
    echo "alias grep='grep --color=auto'" >> $HOME/.bash.conf
}
