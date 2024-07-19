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

term_colors() {
for COLOR in {0..255} 
do
    for STYLE in "38;5"
    do 
        TAG="\033[${STYLE};${COLOR}m"
        STR="${STYLE};${COLOR}"
        echo -ne "${TAG}${STR}${NONE}  "
    done
    echo
done
}
