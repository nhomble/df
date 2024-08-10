#!/usr/bin/env sh

alias k='kubectl'
alias k8s='kubectl'
alias ls='ls --color=auto'
alias sl='ls'
alias l='ls'
alias cd-='cd -'
alias cd..='cd ..'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias shutdown='sudo poweroff'
alias feh='feh --scale'
alias dev='cd ~/dev'
alias cdtmp='cd $(mktemp -d)'
alias guit='git'
alias giut='git'

function jsdebug_on() {
  export NODE_OPTIONS_OLD="$NODE_OPTIONS"
  export NODE_OPTIONS="$NODE_OPTIONS_OLD --inspect --inspect-brk"
  export DF_JSDEBUG_ON=true
}

function jsdebug_off(){
  export NODE_OPTIONS="$NODE_OPTIONS_OLD"
  unset NODE_OPTIONS_OLD
  unset DF_JSDEBUG_ON
}
