#!/bin/bash

#linux process file descriptors counter
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#* This script count descriptors used by POSIX process considered by groups.
#* Author: Gregory Komissarov <gregory.komissarov@gmail.com>
#* Created: 2012-04-09
#* Last modified: 2012-04-09
#* Requirements: Linux v2.6.* and bash v4.*

#------------
# constraints
#------------
declare -A TYPES 
TYPES=( ["epoll"]="eventpoll"\
        ["pipe"]="pipe"\
        ["socket"]="socket"\
        ["jar"]="\.jar"\
      )
FD="; "
SLEEP_TIME=1

#-----
# main
#-----
# check params
if [ "$1" != "" ]; then
    if [ -f $1 ]; then
        pid=`cat $1`
    else
        let pid=$1
    fi
    if ! kill -0 $pid > /dev/null 2>&1; then
        echo "No such process or pid file: "$pid
        exit 1
    fi
else
    echo "1st positional parameter must be PID or /full/path/to/pid_file"
    exit 1
fi

while [ 1 ]; do
    declare -A result
    sum=0
    
    listing=`ls -l /proc/$pid/fd/ 2>/dev/null | awk '{print $10}'`
    epoch=`date +%s.%N`
    out_line="epoch:${epoch}${FD}"
    
    for chunk in "${!TYPES[@]}";
    do
        result["$chunk"]=`printf "$listing" 2> /dev/null | grep -c "${TYPES["$chunk"]}"` 
        sum=$(($sum + ${result["$chunk"]}))
        out_line="${out_line}${chunk}:${result["$chunk"]}${FD}"
    done
    
    total=`printf "${listing}" 2> /dev/null | wc -l`
    misc=$(($total - $sum)) 
    out_line="${out_line}misc:$misc${FD}total:$total"
    
    echo -ne "$out_line\n"
    sleep $SLEEP_TIME
done
#----
# end
#----
