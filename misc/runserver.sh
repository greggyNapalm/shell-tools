#!/bin/bash

args=''

# db
args=$args'--datastore_path=../../db.lqe-tool.big-backup'

# Network
#args=$args' --port=80'
#args=$args'--address=0.0.0.0'

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

echo 'passing args: '$args

dev_appserver.py $args .
