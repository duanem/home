# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#EDITOR=nano
EDITOR=bbedit
export EDITOR

LESS=iX
export LESS

PAGER=less
export PAGER

alias ll='ls -lh'
alias more=less
alias edit=bbedit
alias confroot='export CONF_ROOT=$PWD/conf;echo "${CONF_ROOT}"'
alias pythonpath='export PYTHONPATH=$PWD/python;echo "${PYTHONPATH}"'

source ~/.git.completion.sh

# User specific aliases and functions

findall()
{
    find ${1} -type f -print0 | xargs -0 grep ${@:2}
}

findh()
{
    find ${1} -name \*.h -print0 | xargs -0 grep ${@:2}
}

findcpp()
{
    find ${1} -name \*.cpp -print0 | xargs -0 grep ${@:2}
}

findsrc()
{
    find ${1} -name \*.h -print0 -or -name \*.cpp -print0 | xargs -0 grep ${@:2}
}

