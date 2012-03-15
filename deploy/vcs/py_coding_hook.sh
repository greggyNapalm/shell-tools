#!/bin/sh                                                                                                                                           

error=0
for file in `git diff-index --name-only HEAD | grep -e "\.py"`; do
    grep -e 'coding: utf-8' $file > /dev/null
    if [ $? -ne 0 ];
    then
        echo "python $file without coding directive"
        error=1
    fi
done

exit $error
