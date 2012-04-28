shell-tools: dotfiles and helpers
=================================


Installation
------------

The latest **stable version** of shell-tools can always be installed (or updated) from this repo::

    now=`date +%s-%N`
    curl -L --insecure https://github.com/greggyNapalm/shell-tools/raw/master/HOME/.shell_functions.sh > /tmp/$now
    # never run script from internet  without reading them first
    source /tmp/$now
    shell_update

Ubuntu 8 LTS::

    git clone git://github.com/altercation/vim-colors-solarized.git
    mv vim-colors-solarized .vim/bundle/
