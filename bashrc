umask 022
# export PS1="\h:\W$"
# export PS1="\[\033[32m\][\t]\[\033[32m\]-[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\h\[\033[1;33m\]-> \[\033[0m\]"
export PS1="\[\033[32m\][\t]-[\w]\[\033[0m\]\n\[\033[1;36m\]\h\[\033[1;33m\]-> \[\033[0m\]"
export SCREENDIR="$HOME/.screen"

export PATH="$PATH:~/bin:~/.local/bin"

alias grep='grep --color'
alias vi="vim"
alias ls='ls -ihF --color=tty'
alias ll='ls -il'
alias la='ls -iA'
alias l='ls -CF'
alias gdf="git diff --no-index"
alias vdf="vimdiff"

cd_func ()
{
    local x2 the_new_dir adir index
    local -i cnt

    if [[ $1 ==  "--" ]]; then
        dirs -v
        return 0
    fi

    the_new_dir=$1
    [[ -z $1 ]] && the_new_dir=$HOME

    if [[ ${the_new_dir:0:1} == '-' ]]; then
        #
        # Extract dir N from dirs
        index=${the_new_dir:1}
        [[ -z $index ]] && index=1
        adir=$(dirs +$index)
        [[ -z $adir ]] && return 1
        the_new_dir=$adir
    fi

    #
    # '~' has to be substituted by ${HOME}
    [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

    #
    # Now change to the new dir and add to the top of the stack
    pushd "${the_new_dir}" > /dev/null
    [[ $? -ne 0 ]] && return 1
    the_new_dir=$(pwd)

    #
    # Trim down everything beyond 11th entry
    popd -n +11 2>/dev/null 1>/dev/null

    #
    # Remove any other occurence of this dir, skipping the top of the stack
    for ((cnt=1; cnt <= 10; cnt++)); do
        x2=$(dirs +${cnt} 2>/dev/null)
        [[ $? -ne 0 ]] && return 0
        [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
        if [[ "${x2}" == "${the_new_dir}" ]]; then
            popd -n +$cnt 2>/dev/null 1>/dev/null
            cnt=cnt-1
        fi
    done

    return 0
}
alias cd=cd_func

#alias for tmux
# alias tls='tmux ls'
# alias ta='tmux attach -t'
# alias tn='tmux new -s'
# alias tkill='tmux kill-session -t'

