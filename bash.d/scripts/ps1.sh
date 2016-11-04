deps() {
    echo "path"
}
startfile() {
    if [[ $EUID == 0 ]]; then
        export PS1="$RED\u[\w]🚨  $NORMAL"
    else
        case $(date +%m) in
        12|1|2)
            export PS1="$LIGHTCYAN\u[\w]☃ $NORMAL";;
        3|4|5)
            export PS1="$LIGHTMAGENTA\u[\w]🌸  $NORMAL";;
        6|7|8)
            export PS1="$YELLOW\u[\w]🌞  $NORMAL";;
        9|10|11)
            export PS1="$BROWN\u[\w]🍂  $NORMAL";;
        esac
    fi
}
source $HOME/.bash.d/defines/colors.sh
