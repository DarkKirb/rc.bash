deps() {
    echo "path i18n"
}
startfile() {
    if [[ -f /usr/local/share/bash-completion/bash_completion.sh ]]; then
        echo 'source /usr/local/share/bash-completion/bash_completion.sh' >> $HOME/.bash.conf
    fi
    if [[ -f /usr/share/bash-completion/bash_completion.sh ]]; then
        echo 'source /usr/share/bash-completion/bash_completion.sh' >> $HOME/.bash.conf
    fi
}

