# Stuff for an interactive shell is in here.

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# This is based on Fedora's /etc/profile.d/256term.sh.
if [ -n "$COLORTERM$XTERM_VERSION$ROXTERM_ID$KONSOLE_DBUS_SESSION" ]; then
    case "$TERM" in
    xterm|screen|tmux) TERM=$TERM-256color ;;
    esac
    export TERM

    if [ -n "$TERMCAP" ] && [ "screen-256color" = "$TERM" ]; then
        export TERMCAP=$(echo "$TERMCAP" | sed -e 's/Co#8/Co#256/g')
    fi
fi

# Usage: _path_adder VARIABLE [ DIR ... ]
_path_adder() {
    local -r P=$1 && shift
    local d val=${!P}
    for d; do
        [ -h $d ] && d=$(/bin/readlink -f $d 2> /dev/null)
        [ -d "$d" ] || continue
        d=$(/bin/realpath $d 2> /dev/null)
        case :$val: in
            # If it's already there, don't do anything.
            *:$d:*)
            ;;
            # Otherwise, add it.
            *)
                if [ -z "$val" ]; then
                    val=$d
                else
                    val=$val:$d
                fi
            ;;
        esac
    done

    [ "$val" ] && export $P=$val
}

alias add_to_path='_path_adder PATH'
alias add_to_manpath='_path_adder MANPATH'

# Usage: nvim [ file0 file1 ... ]
nvim ()
{
    local arg
    for arg; do
        if [ -e $arg ]; then
            continue
        fi
        case $arg in
            *.sh | *.bash)
                echo -e "#!/bin/bash\n\nset -eu -o pipefail\n" >> $arg
                chmod +x $arg
            ;;
            *.pl)
                echo -e "#!/usr/bin/perl -w\n" >> $arg
                chmod +x $arg
            ;;
            *.py)
                echo -e "#!/usr/bin/env python3\n" >> $arg
                chmod +x $arg
            ;;
            *.html)
                cat >> $arg <<HTMLTEMPLATE
<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" >
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
</body>
</html>
HTMLTEMPLATE
            ;;
            *)
            ;;
        esac
    done

    vim "$@"
}

_set_PS1() {
    local last_ret=$? job_cnt=
    local -a j=($(jobs -p))

    if [ ${#j[*]} -gt 0 ]; then
        job_cnt="\[\e[33m\]${#j[*]} "
    fi

    if [ 0 -eq $last_ret ]; then
        PS1="$job_cnt\[\e[32m\]$\[\e[m\] "
    else
        PS1="$job_cnt\[\e[31m\]$last_ret $\[\e[m\] "
    fi

    return $last_ret
}

# PATH started to get a bit crusty with /snap/bin added multiple times, etc.
PATH=
add_to_path ~/bin ~/scripts ~/.{cargo,local}/bin /{,usr/}{,local/}{,s}bin /snap/bin
add_to_manpath ~/man ~/local/share/man

PS2="\[\e[33m\].\[\e[m\] "
HISTTIMEFORMAT="%Y-%m-%d %T  "
COLORFGBG="lightgray;black"
REPLYTO="Joshua Hughes <kivhift@gmail.com>"
PYTHONPATH=~/lib/python
PYTHONSTARTUP=~/.pythonrc
PERL5LIB=~/lib/perl
export CVS_RSH=ssh
export EDITOR=vim
export PAGER=less
export LESS=FRX
export SHELL=/bin/bash
export LANG=en_US.UTF-8
export LC_COLLATE=C
export PATH PS2 COLORFGBG REPLYTO PERL5LIB
export PYTHONPATH PYTHONSTARTUP
export PROMPT_COMMAND=_set_PS1

[ -x /usr/bin/dircolors ] && [ -r ~/.dir_colors ] \
    && eval $(/usr/bin/dircolors -b ~/.dir_colors)

if ! shopt -oq posix; then
    usbc=/usr/share/bash-completion/bash_completion
    ebc=/etc/bash_completion
    if [ -r $usbc ]; then
        . $usbc
    elif [ -r $ebc ]; then
        . $ebc
    fi
    unset usbc ebc
fi

shopt -s no_empty_cmd_completion checkwinsize

hn=$(hostname)
hnrc=~/.bashrc_${hn,,}
[ -r $hnrc ] && . $hnrc
lrc=~/.bashrc_local
[ -r $lrc ] && . $lrc
unset hn hnrc lrc

# vim:ft=sh
