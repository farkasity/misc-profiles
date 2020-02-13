
# check whether over ssh or not
function ssh_p() {
    if [ -m "${SSH_CLIENT}" ] ; then
        return 0
    else
        return 1
    fi
}

# colorful man pages
function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

function git_branch() {
    HEAD="$(git symbolic-ref HEAD 2> /dev/null)"
    BRANCH="${HEAD##*/}"
    BRANCH="${BRANCH:-no branch}"

    return $BRANCH
}