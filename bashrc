# .bashrc

# User specific aliases and functions
alias ls="ls -F --color=auto"
alias tmux="tmux -2"

parse_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# set a fancy prompt
case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\h: \w\007\]'
        ;;
    *)
        TITLEBAR=''
        ;;
esac

PS1="${TITLEBAR}\[\033[31m\]\u@\h: \[\033[0;33m\]\w\[\033[0m\]\$(parse_git_branch)\n> "

umask 077

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/gedit
export PAGER=/usr/bin/less
export LESS="eFRX"
