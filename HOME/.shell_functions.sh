shell_update() {
    # Update dotfiles like bashrc and vimmrc from GIT repo 
    GIT_USER="greggyNapalm"
    GIT_REPO="shell-tools"
    
    TMP_DIR=`date +%s-%N`
    BACKUP_DIR=$HOME"/."$GIT_REPO"/"$TMP_DIR

    cd /tmp 
    TMP_DIR=`date +%s-%N`
    mkdir $TMP_DIR; cd $TMP_DIR
    
    wget --no-check-certificate "https://github.com/"$GIT_USER"/"$GIT_REPO"/tarball/master" -O master.tgz >/dev/null 2>&1
    tar xzf master.tgz
    REPO_DIR=`find . -name $GIT_USER"-"$GIT_REPO"*"`
    mv $REPO_DIR $GIT_REPO
    cd $GIT_REPO"/HOME"
    
    # backup current dotfiles
    mkdir -p $BACKUP_DIR
    for file in .[!.]* ; do
        cp -pR $HOME"/"$file $BACKUP_DIR"/"
    done
    
    cp -pR .[!.]* ~/
    
    cd ~
    rm -Rf "/tmp/"$TMP_DIR

    # download/update vim bundles from github
    git --version && vim +BundleInstall +qall || echo 'You need to have git client to update vim bundles'

    if [ ! -f ~/.vim/colors/solarized.vim ]
    then
        if [ -f ~/.vim/bundle/solarized/colors/solarized.vim ]
        then
            ln -s ~/.vim/bundle/solarized/colors/solarized.vim ~/.vim/colors/
        fi
    fi
}
wanip() {
    # return ip addr that Internet severs will associate with as. 
    wget -q -O - checkip.dyndns.com/ | awk '{print $6}'| sed 's/<.*>//'
}

luna-stat() {
    # collect perf data in lunapark complitable format
    dstat -Tcdnmly --noheaders --output xxx.dstat
}

tm() {
    SLOT=`tmux ls | fgrep -v '(attached)' | head -1 | awk -F':' '{print $1}'`
    if [ $SLOT ]
    then
        #echo "attach to ${SLOT}"
        tmux attach -d -t $SLOT
    else
        #echo 'New session'
        tmux new-session bash
    fi
}

h() {
    # quick history search
    history | grep $1
}

function jc {
    # set this to the host you'll proxy through.
    proxy_host="10.0.6.8 -p 22"    host=$1

    jmxport=8811
    proxy_port=${2:-8123}

    if [ "x$host" = "x" ]; then
        echo "Usage: jc <remote server> [proxy port]"
        return 1
    fi

    # start up a background ssh tunnel on the desired port
    ssh -N -f -D$proxy_port $proxy_host

    # if the tunnel failed to come up, fail gracefully.
    if [ $? -ne 0 ]; then
        echo "Ssh tunnel failed"
        return 1
    fi

    ssh_pid=`ps awwwx | grep "[s]sh -N -f -D$proxy_port" \
        | awk '{print $1}'`
    echo "ssh pid = $ssh_pid"

    # Fire up jconsole to your remote host
    jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=$proxy_port \
        service:jmx:rmi:///jndi/rmi://${host}:${jmxport}/jmxrmi

    # tear down the tunnel
    kill $ssh_pid
}

py-new() {
UNIQ_DATE=`date +%s_%N`
FNAME=$UNIQ_DATE".py"

cat > $FNAME << EOF
#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
app.module
~~~~~~~~~~~~~~~

Some info about this module.
"""
import os

def main():
    print 'Done'

if __name__ == '__main__':
    main()
EOF

chmod +x $FNAME
echo 'Python source file: '"$FNAME"
}
#----
# end 
#----
