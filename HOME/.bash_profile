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

#----------
# functions
#----------
#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
wanip() {
    # return ip addr that Internet severs will associate with as. 
    wget -q -O - checkip.dyndns.com/ | awk '{print $6}'| sed 's/<.*>//'
}

luna-stat() {
    # collect perf data in lunapark complitable format
    dstat -Tcdnmly --noheaders --output xxx.dstat
}

alias sshu="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias mem='vim -c "set ft=conf" ~/mem'

#----
# git
#----
if [ `which git` ]; then
    # User data
    git config --global user.name "Gregory Komissarov"
    git config --global user.email gregory.komissarov@gmail.com 
    #git config --global core.editor /usr/bin/vim
    
    # Colors
    git config --global color.diff auto
    git config --global color.status auto
    git config --global color.branch auto
     
    # Aliases
    git config --global alias.co checkout
    git config --global alias.ci commit
    git config --global alias.up "remote update"
    git config --global alias.st status
    
    # Excludes
    git config --global core.excludesfile ~/.gitignore
fi

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