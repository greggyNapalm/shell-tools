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

#--------
# HISTORY
#--------
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:ls:[bf]g:exit"

#---------------
# TERMINAL TITLE
#---------------
HOSTNAME_SHORT=`hostname -s`
PROMPT_COMMAND='echo -ne "\033]0;$HOSTNAME_SHORT\007"'

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

elif [ $UNAME == "Darwin" ]
then
    # Mac OS
    alias ls='gls --color'
    alias echo='gecho'
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

#-------
# Screen
#-------
if [ $SHLVL == 1 ]; then
    FIRST_DETACHED=`screen -ls | grep -m1 "Detached" | awk '{print $1}'`
    
    if [ $FIRST_DETACHED ]
    then
        screen -r $FIRST_DETACHED
    else
        screen -R -q
    fi
fi
