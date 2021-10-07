#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
alias term='st'
alias dev='cd ~/dev'
alias cdtmp='cd $(mktemp -d)'

export EDITOR="vim"
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

export GOPATH=$HOME/dev/go
export GOBIN=$HOME/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.krew/bin

if [[ -n "$XTERM_VERSION" ]]; then
    command -v transset-df &> /dev/null && transset-df --id "$WINDOWID" &> /dev/null
fi


command -v ~/bin/boot/start &> /dev/null && ~/bin/boot/start

EXTENSIONS=(
    ~/.bash_k8s_extension
)
for ext in "${EXTENSIONS[@]}"; do 
    if [[ -e $ext ]]; then
        source "$ext"
    fi
done

complete -C /usr/bin/terraform terraform

_node_complete() {
  local cur_word options
  cur_word="${COMP_WORDS[COMP_CWORD]}"
  if [[ "${cur_word}" == -* ]] ; then
    COMPREPLY=( $(compgen -W '--check --redirect-warnings --inspect-brk --track-heap-objects --throw-deprecation --prof-process [has_eval_string] --experimental-vm-modules --pending-deprecation --expose-internals --no-warnings --no-deprecation --insecure-http-parser --max-old-space-size --inspect-brk-node --perf-prof --preserve-symlinks-main --stack-trace-limit --inspect --abort-on-uncaught-exception --debug --inspect-port --debug-brk --no-force-async-hooks-checks --v8-options --loader --perf-basic-prof --trace-event-categories --help --security-reverts --icu-data-dir --openssl-config --napi-modules --v8-pool-size --eval --expose-http2 --version --zero-fill-buffers --max-http-header-size --completion-bash --interactive --use-bundled-ca --require --preserve-symlinks --expose_http2 --trace-event-file-pattern --tls-cipher-list --experimental-repl-await --title --use-openssl-ca [ssl_openssl_cert_store] --trace-sync-io --print --unhandled-rejections --experimental-modules --trace-warnings --trace-deprecation --experimental-worker --debug-port --inspect= -r -p --debug= --debug-brk= -i --inspect-brk= --prof-process --inspect-brk-node= -c -e --print <arg> -pe --trace-events-enabled -v -h' -- "${cur_word}") )
    return 0
  else
    COMPREPLY=( $(compgen -f "${cur_word}") )
    return 0
  fi
}
complete -F _node_complete node node_g
