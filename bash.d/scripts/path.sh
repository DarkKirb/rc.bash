deps() {
    echo ""
}
startfile() {
    #Copy some functions
    cat $HOME/.bash.d/functions/path.sh >> $HOME/.bash.conf
    export PATH=/bin:/usr/bin:$HOME/.local/bin
    if [ $EUID -eq 0 ] ; then
        pathappend /sbin:/usr/sbin:$HOME/.local/sbin
        unset HISTFILE
    fi
    if [ -d /usr/local/lib/pkgconfig ]; then
        pathappend /usr/local/lib/pkgconfig PKG_CONFIG_PATH
    fi
    if [ -d /usr/local/bin ]; then
        pathappend /usr/local/bin
    fi
    if [ -d /usr/local/sbin -a $EUID -eq 0 ]; then
        pathappend /usr/local/sbin
    fi
    pathappend /usr/share/man MANPATH
    pathappend /usr/share/info INFOPATH
}
. $HOME/.bash.d/functions/path.sh
