# Stuff for a login shell should go in here.
umask 0022

# If this shell is also interactive, see if ~/.bashrc is around and source it.
case "$-" in *i* ) [ -r ~/.bashrc ] && . ~/.bashrc ;; esac
