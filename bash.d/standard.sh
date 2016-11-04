#Some constants to prettify output
NORMAL="\e[0;39m"
SUCCESS="\e[1;32m"
WARNING="\e[1;33m"
FAILURE="\e[1;31m"
INFO="\e[1;36m"
BRACKET="\e[1;34m"
# Use a colored prefix
BMPREFIX="     "
SUCCESS_PREFIX="${SUCCESS}  *  ${NORMAL}"
FAILURE_PREFIX="${FAILURE}*****${NORMAL}"
WARNING_PREFIX="${WARNING} *** ${NORMAL}"
SKIP_PREFIX="${INFO}  S  ${NORMAL}"
SUCCESS_SUFFIX="${BRACKET}[${SUCCESS}  OK  ${BRACKET}]${NORMAL}"
FAILURE_SUFFIX="${BRACKET}[${FAILURE} FAIL ${BRACKET}]${NORMAL}"
WARNING_SUFFIX="${BRACKET}[${WARNING} WARN ${BRACKET}]${NORMAL}"
SKIP_SUFFIX="${BRACKET}[${INFO} SKIP ${BRACKET}]${NORMAL}"
if [ -z "${COLUMNS}"]; then
    COLUMNS=$(stty size)
    COLUMNS=${COLUMNS##* }
fi
COL=$((${COLUMNS} - 8))
WCOL=$((${COL} - 2))
SET_COL="\e[${COL}G"      # at the $COL char
SET_WCOL="\e[${WCOL}G"    # at the $WCOL char
CURS_UP="\e[1A\e[0G"   # Up one line, at the 0'th char
CURS_ZERO="\e[0G"
#Some commands for error handling
trap "" INT QUIT TSTP
success_msg() {
    echo -ne "${BMPREFIX}${@}"
    echo -e "${CURS_ZERO}${SUCCESS_PREFIX}${SET_COL}${SUCCESS_SUFFIX}"
    return 0
}
failure_msg() {
    echo -n -e "${BMPREFIX}${@}"
    echo -e "${CURS_ZERO}${FAILURE_PREFIX}${SET_COL}${FAILURE_SUFFIX}"
    exit 1
}
warning_msg() {
    echo -n -e "${BMPREFIX}${@}"
    echo -e "${CURS_ZERO}${WARNING_PREFIX}${SET_COL}${WARNING_SUFFIX}"
}
skip_msg() {
    echo -n -e "${BMPREFIX}${@}"
    echo -e "${CURS_ZERO}${SKIP_PREFIX}${SET_COL}${SKIP_SUFFIX}"
}
msg() {
    echo -n -e "${BMPREFIX}${@}"
}
evaluate() {
    if [ $? = 0 ]; then
        success_msg $@
    else
        failure_msg $@
    fi
}
