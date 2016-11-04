#!/usr/bin/env bash
#This file is called by .bashrc. It sets up everything.
#This file is run on login and regenerates ~/.bash.conf
. .bash.d/standard.sh
rm $HOME/.bash.conf
success_msg "Initialized initial state."
msg "Loading constants."
for constants in $HOME/.bash.d/defines/*.sh; do
    . $constants
done
success_msg
export net_start=1
#Now we go through the list one by one
for script in $HOME/.bash.d/scripts/*.sh ; do
    sname=$(echo $script | sed 's/\// /g' | python3 -c "print((input().split(' ')[-1])[:-3])")
    reqvar=${sname}_start
    if [[ ${!reqvar} != 1 ]]; then
        bash $HOME/.bash.d/start.sh $script
        if [[ $? = 1 ]]; then
            failure_msg "Couldn't start at least one script"
        fi
        source envvar
    fi
done
env | sed "s/'/\\'/g" | sed "s/=/='/" | sed "s/$/'/"| awk '{print "export",$0;}' >> $HOME/.bash.conf
chmod +x ~/.bash.conf
success_msg "Successfully writen the config"
rm envvar
