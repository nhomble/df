#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.config/df/core.sh
PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\h \W $\[$(tput sgr0)\] "
export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
eval "$(basher init - bash)"             ##basher5ea843
