shell-tools: dotfiles and helpers
=================================


Installation
------------

The latest **stable version** of shell-toolse can always be installed (or updated) from this repo::

    now=`date +%s-%N`
    curl -L https://github.com/greggyNapalm/shell-tools/raw/master/HOME/.shell_functions.sh > /tmp/$now
    source /tmp/$now
    shell_update
