#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias sl='ls'
alias l='ls'
alias cd-='cd -'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias shutdown='sudo poweroff'
alias chromium='google-chrome-stable'
alias google='google-chrome-stable'
alias feh='feh --scale'
alias term='xterm'

export EDITOR="nvim"
export SVN_EDITOR="$EDITOR"
alias vim="$EDITOR"
alias vmi="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"

PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\h \W $\[$(tput sgr0)\] "

NOTE_DIR=~/.notepad_dir
isNOTE=false
temp=$(ps aux | grep NOTES | grep -v grep | awk '{print $2}')
if [[ "$PPID" = "$temp" ]]; then
	if [[ ! -e "$NOTE_DIR" ]]; then
		echo $HOME > $NOTE_DIR
	fi
	cd "$(cat $NOTE_DIR)"
	isNOTE=true;
fi

function cd(){
	builtin cd "$@";
	if [[ $isNOTE = true ]]; then
		pwd > $NOTE_DIR
	fi	
	return
}
PATH=$PATH:$HOME/bin

if [[ -n "$XTERM_VERSION" ]]; then
    command -v transset-df &> /dev/null && transset-df --id "$WINDOWID" &> /dev/null
fi


command -v ~/bin/boot/start &> /dev/null && ~/bin/boot/start
