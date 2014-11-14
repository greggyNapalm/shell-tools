#------------------------------
# Default aliases and functions
#------------------------------
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

#--------
# aliases
#--------
alias sshu="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias mem='vim -c "set ft=conf" ~/mem'
alias vimrc='vim ~/.vimrc'

alias ipython='/usr/bin/env python $(which ipython)'
alias clean-py="find . -type f -name '*.py[co]' -delete"
alias clean-swp="find . -type f -name '*.swp' -delete"
alias f="find . -name"
#alias tm="tmux a || tmux new-session bash"
alias py27="export PATH=/opt/python/2.7.3/bin:$PATH &&\
                source /opt/python/2.7.3/bin/virtualenvwrapper.sh; python -V"
alias gdiff='git diff -U10 | dwdiff --diff-input -c | less -R'

#----------
# functions
#----------
source ~/.shell_functions.sh

#-------
# editor
#-------
export EDITOR='vim'
export SVN_EDITOR='vim --noplugin'

#---------------------
# colorize grep output
#---------------------
alias grep='grep --color=auto'
export GREP_COLOR='1;33'
export PAGER=less

#--------
# HISTORY
#--------
shopt -s cmdhist
export HISTSIZE=1000000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT='%F %T '

shopt -s histappend
shopt -s cmdhist

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#---------------
# TERMINAL TITLE
#---------------
HOSTNAME_SHORT=`hostname -s`
export PROMPT_COMMAND="echo -ne \"\033]0;$HOSTNAME_SHORT\007\"; $PROMPT_COMMAND"

#-----------------
# AUTOCOMPLETE SSH
#-----------------
_compssh ()
{
cur=${COMP_WORDS[COMP_CWORD]};
COMPREPLY=($(compgen -W '$(cat ~/.ssh/hosts_list | grep -v "^#")' -- $cur))
}
complete -F _compssh ssh

#----
# git
#----
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

#-----------------
# OS specific part
#-----------------
UNAME=`uname`
if [ $UNAME == "Linux" ]
then
    # Linux
    alias ls="ls --color"
    export LC_ALL="en_US.utf8"
    export LANG="en_US"
    export LANGUAGE="en_US.utf8"

elif [ $UNAME == "Darwin" ]
then
    # Mac OS
    export LC_ALL="en_US.UTF-8"
    export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/bin:/opt/local/sbin:/opt/gradle/bin:$PATH
    source /opt/local/etc/bash_completion
    export DISPLAY=:0.0
    alias readlink='greadlink'
    alias ls='gls --color'
    alias echo='gecho'
    alias date='gdate'
    alias ldd='otool -L'
    export ARCHFLAGS="-arch i386 -arch x86_64"
    git config --global core.editor /usr/bin/vim
    #export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin":/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH="/opt/local/share/man:${MANPATH}"
    defaults write com.apple.LaunchServices LSQuarantine -bool false

elif [ $UNAME == "FreeBSD" ]
then
    # FreeBSD
    alias ls='ls -G'

elif [ $UNAME == "SunOS" ]
then
    # SunOS
    alias ls='/usr/local/bin/ls --color=auto'
    alias grep='ggrep --colour'
    alias tar='gtar'
fi

#------
# local
#------
if [ -e "$HOME/.bash_locale" ]; then
    . "$HOME/.bash_locale"
fi

#-------
# Python
#-------
WRAP_PATH=`which virtualenvwrapper.sh`
if [ $WRAP_PATH ]; then
    # We have wrapper script in PATH, let's use it.
    if [ ! -d ~/.virtualenvs ]; then
        mkdir ~/.virtualenvs
    fi
    export WORKON_HOME=~/.virtualenvs
    source $WRAP_PATH
fi

#-----
# tmux 
#-----
export PS1='\H:\W \u\$ '
export TERM=xterm-256color
