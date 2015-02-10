#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sl='ls'
alias l='ls'
alias vmi='vim'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias shutdown='sudo poweroff'
alias server='ssh 129.2.220.246'
alias serversftp='sftp 129.2.220.246'
alias umd='ssh -X nhomble@linux.grace.umd.edu'
alias chromium='google-chrome-stable'
alias google='google-chrome-stable'
alias feh='feh --scale'

# I don't really want to add my projets to my path so...
alias ohmm='~/code/ohmm/ohmm'
alias gsearch='~/code/gcmd/gsearch'

export TERM="xterm-256color"

PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\W $\[$(tput sgr0)\] "

isNOTE=false
temp=$(ps aux | grep NOTES | grep -v grep | awk '{print $2}')
if [ "$PPID" = "$temp" ]; then
	if [ ! -e /tmp/.notepad_dir ]; then
		echo "/home/nicolas/" > /tmp/.notepad_dir
	fi
	cd "$(cat /tmp/.notepad_dir)"
	isNOTE=true;
fi

function cd(){
	builtin cd "$@";
	if [ $isNOTE = true ]; then
		pwd > /tmp/.notepad_dir
	fi	
	return
}

PATH=$PATH:/home/nicolas/bin
EDITOR="vim"
SVN_EDITOR="vim"
INIT="$(tty | grep tty1)"
if [ ! -z $INIT ] && [ -z "$DISPLAY" ]; then
	startx;
fi
