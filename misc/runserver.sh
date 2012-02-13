#!/bin/bash

args=''

# db
args=$args'--datastore_path=/Users/gkomissarov/Downloads/db'

# Network
#args=$args' --port=80'
args=$args' --address=0.0.0.0'

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

# common info
clear
UNAME=`uname`
if [ $UNAME == "Darwin" ]
then
    GAE_VER=`cat /Applications/GoogleAppEngineLauncher.app/Contents/Info.plist | grep -m1 "Google Inc" | awk '{print $2}'`
fi

python -V
echo "GAE version: ""${GAE_VER%?}"
echo 'passing args: '$args
for((i=1;i<=80;i++));do printf "%s" "+";done;printf "\n"

# launch it
dev_appserver.py $args .
