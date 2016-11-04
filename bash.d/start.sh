. $HOME/.bash.d/standard.sh
#First of all, the program to start is $1
. $1
sname=$(echo $1 | sed 's/\// /g' | python3 -c "print((input().split(' ')[-1])[:-3])")
for req in $(deps); do
    reqvar=${req}_start
    if [[ ${!reqvar} != 1 ]]; then
        bash $HOME/.bash.d/start.sh $HOME/.bash.d/scripts/$req.sh # Start dependency first
        if [[ $? != 0 ]]; then
            failure_msg "Starting $sname."
        fi
        source envvar
    fi
done
#OK. all dependencies started
startfile
evaluate "Starting $sname."
varname=${sname}_start
export ${varname}=1
env | sed "s/'/\\'/g" | sed "s/=/='/" | sed "s/$/'/"| awk '{print "export",$0;}' > envvar
