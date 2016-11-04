deps() {
    echo "path"
}
startfile() {
    if [[ $EUID == 0 ]]; then
        export PS1="\e31m\u[\w]🚨  $NORMAL"
    else
        case $(date +%m) in
        12|1|2)
            export PS1="\e[96m\u[\w]☃ $NORMAL";;
        3|4|5)
            export PS1="\e[95m\u[\w]🌸  $NORMAL";;
        6|7|8)
            export PS1="\e[93m\u[\w]🌞  $NORMAL";;
        9|10|11)
            export PS1="\e[33m\u[\w]🍂  $NORMAL";;
        esac
    fi
}
