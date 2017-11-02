# ls
alias ls='ls --color=auto'

# This function lists dot files for the given argument or the current
# directory, but only if there are some to list.  This keeps ls from
# complaining about not finding a file that has the same name as the glob.
__ls_dots()
{
    [ -n "$1" ] && [ -d "$1" ] && local root="${1%%/}/"
    local listees=$(echo "$root".[!.]*)
    if [ "$listees" != "$root"'.[!.]*' ] ; then
        ls -d $listees $@
    fi
}
alias l.=__ls_dots

alias l1='ls -1'
alias l=ls
alias a='ls -A'
alias v='ls -l'
alias vv='ls -lh'
alias tp='type -p'
alias eg='env | grep'

alias h10='history 10'
alias h20='history 20'

alias ..='cd .. && pwd'
alias ...='cd ../.. && pwd'

alias m=less
alias mk=make
alias gv='gv -spartan -watch'
alias enscript='enscript -2 -r -M Letter'
alias cal='cal -3m'
alias grep='grep --color=auto'
alias gdb='gdb --quiet'

# git
alias ga='git add'
alias gai='git add --interactive'
alias gb='git branch'
alias gba='git branch --all'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gk='gitk --all'
alias gl='git log'
alias gl3='git log -3'
alias gs='git status -s -b'
alias gsu='git status -s -b -unormal'

hn=$(hostname)
hna=~/.bash_aliases_${hn,,}
[ -r $hna ] && . $hna
unset hn hna

# vim:ft=sh
