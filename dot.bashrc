# Stuff for an interactive shell is in here.

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# This is based on Fedora's /etc/profile.d/256term.sh.
if [ -n "$COLORTERM$XTERM_VERSION$ROXTERM_ID$KONSOLE_DBUS_SESSION" ] ; then
    case "$TERM" in
    xterm|screen) TERM=$TERM-256color ;;
    esac
    export TERM

    if [ -n "$TERMCAP" ] && [ "screen-256color" = "$TERM" ] ; then
        export TERMCAP=$(echo "$TERMCAP" | sed -e 's/Co#8/Co#256/g')
    fi
fi

# Usage: add_to_path [ path0 path1 ... ]
add_to_path ()
{
    local d
    for d ; do
        case :$PATH: in
            # If it's already there, don't do anything.
            *:$d:* )
            ;;
            # If it's not there, test if it's a directory and add
            # it if it is.
            * )
                if [ -d "$d" ] ; then
                    PATH="${d}:${PATH}"
                fi
            ;;
        esac
    done
}

# Usage: add_to_manpath [ path0 path1 ... ]
add_to_manpath ()
{
    local d
    for d ; do
        case :$MANPATH: in
            # If it's already there, don't do anything.
            *:$d:* )
            ;;
            # If it's not there, test if it's a directory and add
            # it if it is.
            * )
                if [ -d "$d" ] ; then
                    MANPATH="${d}:${MANPATH}"
                fi
            ;;
        esac
    done
}

# Usage: nvim [ file0 file1 ... ]
nvim ()
{
    local arg
    for arg ; do
        if [ -e $arg ] ; then
            continue
        fi
        case $arg in
            *.sh | *.bash )
                echo -e "#!/bin/bash\n\nset -eu -o pipefail\n" >> $arg
                chmod +x $arg
            ;;
            *.pl )
                echo -e "#!/usr/bin/perl -w\n" >> $arg
                chmod +x $arg
            ;;
            *.py )
                echo -e "#!/usr/bin/env python3\n" >> $arg
                chmod +x $arg
            ;;
            *.html )
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
            * )
            ;;
        esac
    done

    vim "$@"
}

add_to_path ~/bin ~/scripts ~/local/bin
add_to_manpath ~/man

PS1="\[\e[30;42m\]\$\[\e[m\] "
PS2="\[\e[30;41m\].\[\e[m\] "
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
export PATH PS1 PS2 COLORFGBG REPLYTO PERL5LIB
export PYTHONPATH PYTHONSTARTUP

[ -x /usr/bin/dircolors ] && [ -r ~/.dir_colors ] \
    && eval $(/usr/bin/dircolors -b ~/.dir_colors)

if ! shopt -oq posix ; then
    usbc=/usr/share/bash-completion/bash_completion
    ebc=/etc/bash_completion
    if [ -r $usbc ] ; then
        . $usbc
    elif [ -r $ebc ] ; then
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
