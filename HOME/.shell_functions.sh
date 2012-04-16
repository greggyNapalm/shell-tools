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
    ln -s ~/.vim/bundle/solarized/colors/solarized.vim ~/.vim/colors/
    
    cd ~
    rm -Rf "/tmp/"$TMP_DIR
}
wanip() {
    # return ip addr that Internet severs will associate with as. 
    wget -q -O - checkip.dyndns.com/ | awk '{print $6}'| sed 's/<.*>//'
}

luna-stat() {
    # collect perf data in lunapark complitable format
    dstat -Tcdnmly --noheaders --output xxx.dstat
}
#----
# end 
#----
