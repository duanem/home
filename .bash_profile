# .bash_profile

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function elite
{

local GRAY="\[\033[1;30m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
local CYAN="\[\033[0;36m\]"
local LIGHT_CYAN="\[\033[1;36m\]"
local NO_COLOUR="\[\033[0m\]"

case $TERM in
    xterm*|rxvt*)
        local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        local TITLEBAR=""
        ;;
esac

local temp=$(tty)
local GRAD1=${temp:5}
PS1="$TITLEBAR\
$GRAY-$CYAN-$LIGHT_CYAN(\
$CYAN\u$GRAY@$CYAN\h\
$LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
$CYAN\#$GRAY/$CYAN$GRAD1\
$LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
$CYAN\$(date +%H%M)$GRAY/$CYAN\$(date +%d-%b-%y)\
$LIGHT_CYAN)$CYAN-$GRAY-\
$LIGHT_GRAY\n\
$GRAY-$CYAN-$LIGHT_CYAN(\
$CYAN\$$GRAY:$CYAN\w\
$LIGHT_CYAN)$CYAN-$GRAY-$LIGHT_GRAY "
PS2="$LIGHT_CYAN-$CYAN-$GRAY-$NO_COLOUR "
}

function proml {
  local         ESC="\e"
  local         CSI="$ESC["
  local        BLUE="\[${CSI}0;34m\]"
  local         RED="\[${CSI}0;31m\]"
  local   LIGHT_RED="\[${CSI}1;31m\]"
  local       GREEN="\[${CSI}0;32m\]"
  local LIGHT_GREEN="\[${CSI}1;32m\]"
  local       WHITE="\[${CSI}1;37m\]"
  local  LIGHT_GRAY="\[${CSI}0;37m\]"
  local    NO_COLOR="\[${CSI}0m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[$RED\u@\h:\W$GREEN\$(parse_git_branch)$BLUE]\
\$ $NO_COLOR"
PS2='> '
PS4='+ '
}

function completion {
    local         ESC="\e"
    local         CSI="$ESC["
    local        BLUE="\[${CSI}0;34m\]"
    local         RED="\[${CSI}0;31m\]"
    local   LIGHT_RED="\[${CSI}1;31m\]"
    local       GREEN="\[${CSI}0;32m\]"
    local LIGHT_GREEN="\[${CSI}1;32m\]"
    local       WHITE="\[${CSI}1;37m\]"
    local  LIGHT_GRAY="\[${CSI}0;37m\]"
    local    NO_COLOR="\[${CSI}0m\]"

    PS1="$BLUE[$RED\$(date +%H:%M)$BLUE]\
[$RED\u@\h \W$GREEN\$(__git_ps1 \" (%s)\")$BLUE]\$ $NO_COLOR"
}

#proml
#elite
completion

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/bin
