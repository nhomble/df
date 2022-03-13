#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.config/df/core.sh
PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\h \W $\[$(tput sgr0)\] "
