#!/bin/bash

#----------
# arguments 
#----------
args=''

# db
#args=$args'--datastore_path=~/docs/vcs/lqe-tool-backend/db/morpheus_ext'
args=$args'--datastore_path=~/docs/vcs/lqe-tool-backend/db/morpheus_current'

# Network
#args=$args' --port=80'
#args=$args' --address=0.0.0.0'

# Update
args=$args'  --skip_sdk_update_check'

# E-mail 
args=$args'  --show_mail_body'
if [ "$1" = "email" ]; then
    args=$args' --smtp_host=smtp.gmail.com'
    args=$args' --smtp_port=587'
    args=$args' --smtp_user=gregory.komissarov@gmail.com'
    args=$args' --smtp_password='$2
fi

#----------
# functions
#----------
colorize_out () {
    while read line
    do
        case "$line" in 
            INFO*)
                color="$(tput setaf 6)"
            ;;

            WARNING*)
                color="$(tput setaf 3)"
            ;;

            ERROR*)
                color="$(tput setaf 1)"
            ;;
        esac

        echo "$color"$line"$(tput sgr0)"
    done
}

#-----
# main
#-----
if [ `uname` == "Darwin" ]
then
    GAE_ver=`cat /Applications/GoogleAppEngineLauncher.app/Contents/Info.plist | grep -m1 "Google Inc" | awk '{print $2}'`
fi

branch=`git branch | head -1`
py_ver=`python -c "import platform; print platform.python_version()"`

clear
printf "%15s: %s\n%15s: %s\n%15s: %s\n%15s: %s\n"\
    "python" "$py_ver"\
    "GAE" "${GAE_ver%?}"\
    "branch" "$branch"\
    "passing args" "$args"

for((i=1;i<=80;i++));do printf "%s" "+";done;printf "\n"

# launch it
dev_appserver.py $args . 2>&1 | colorize_out

#----
# END 
#----
