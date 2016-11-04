deps() {
    echo "path"
}

startfile() {
    export DEVKITPRO=/home/morten/devkitpro
    export DEVKITARM=$DEVKITPRO/devkitARM/
    pathprepend $DEVKITARM/bin
}


. $HOME/.bash.d/functions/path.sh
