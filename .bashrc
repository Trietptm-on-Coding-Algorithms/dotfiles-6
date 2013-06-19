if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth


# aliases
. ~/.bash_aliases



# ex - archive extractor
# usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.txz)       tar xJf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.xz)        xz -d $1     ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tbz)       tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.tsh)       $1           ;;
      *.sh)        $1           ;;
      *.tar.*)     tar xaf $1   ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# vim stuff
export EDITOR=vim
export VISUAL=vim
#alias vi=vim

# proxy vars
#export HTTP_PROXY=http://localhost:8123
#export HTTPS_PROXY=http://localhost:8123
#export FTP_PROXY=
export HTTP_PROXY=
export HTTPS_PROXY=

# prompt
PS1='[\u@\h \W]\$ '

# Colors and functions!
#COLOR            RAW COLOR
RED='\e[1;31m'    rRED='[1;31m'
GREEN='\e[1;32m'  rGREEN='[1;32m'
YELLOW='\e[1;33m' rYELLOW='[1;33m'
BLUE='\e[1;34m'   rBLUE='[1;34m'
PINK='\e[1;35m'   rPINK='[1;35m'
CYAN='\e[1;36m'   rCYAN='[1;36m'
WHITE='\e[1;37m'  rWHITE='[1;37m'
BLACK='\e[1;39m'  rBLACK='[1;39m'
ENDCOLOR='\e[0m'  rENDCOLOR='[0m'

msg() { # make aur2ccr's normal output prettier and more unified.
  debug "msg('$@')"
  if [ "$1" == "-n" ]; then
    local eopts="$1"
    shift
  fi
  echo -e $eopts "${BLUE}==>${ENDCOLOR}" "$@"
}
warn() { # make aur2ccr's warning messages prettier and more unified.
  debug "warn('$@')"
  if [ "$1" == "-n" ]; then
    local eopts="$1"
    shift
  fi
  echo -e $eopts "${YELLOW}==>${ENDCOLOR}" "$@"
}
err() { # make aur2ccr's error messages prettier and more unified.
  debug "err('$@')"
  if [ "$1" == "-n" ]; then
    local eopts="$1"
    shift
  fi
  echo -e $eopts "${RED}==> ERROR:${ENDCOLOR}" "$@" >&2
}
color() {
  if [ -z "$1" ]; then
    echo -e "Usage: color [${BLACK}black${ENDCOLOR}|${GREEN}green${ENDCOLOR}|${PINK}pink${ENDCOLOR}|${CYAN}cyan${ENDCOLOR}|${BLUE}blue${ENDCOLOR}|${YELLOW}yellow${ENDCOLOR}|${RED}red${ENDCOLOR}|${WHITE}white${ENDCOLOR}|none]"
  elif [ "$1" == "black" ]; then 
    echo -en "${BLACK}"
  elif [ "$1" == "green" ]; then
    echo -en "${GREEN}"
  elif [ "$1" == "pink" ]; then
    echo -en "${PINK}"
  elif [ "$1" == "cyan" ]; then
    echo -en "${CYAN}"
  elif [ "$1" == "blue" ]; then
    echo -en "${BLUE}"
  elif [ "$1" == "yellow" ]; then
    echo -en "${YELLOW}"
  elif [ "$1" == "red" ]; then
    echo -en "${RED}"
  elif [ "$1" == "white" ]; then
    echo -en "${WHITE}"
  elif [ "$1" == "none" -o "$1" == "end" -o "$1" == "endcolor" ]; then
    echo -en "${ENDCOLOR}"
  else
    echo "Unknown color '$1'"
  fi
}

nothing() {
  echo -n 
}

. ~/.welcome # auto-changing ascii art, etc

export PATH=$PATH:/usr/bin/vendor_perl/:/data/george/dev/git/misc-bash/:/data/george/dev/git/misc-chakra/:/data/george/dev/sh/:/data/george/localbin/

source /data/george/localbin/.bashrc