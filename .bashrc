# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	# get trolled!!! -Aaron
	# alias ls='ls --color=auto'
	alias ls='cd'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mntgit='cd /mnt/c/Users/Justin/Documents/GitHub'
# ptpython alias
alias pp='ptpython'

export DISPLAY=$(ip route list default | awk '{print $3}'):0
export LIBGL_ALWAYS_INDIRECT=1

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jstitt/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/jstitt/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/home/jstitt/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/jstitt/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<
eval "$(oh-my-posh prompt init bash --config ~/.jandedobbeleer.omp.json)"
alias pip='python -m pip'
alias ccat='pygmentize -g -O style=monokai,linenos=1 -f console256 '
alias r='ranger'
alias rm='trash-put'
conda activate 310
# fix weird powerline bug on first open of terminal
clear

ra() {
	if [ -z "$RANGER_LEVEL" ]; then
		ranger
	else
		exit
	fi
}
export -f ra
alias r='ra'
alias v='vim'
alias c='code'
alias cl='clear'
. "$HOME/.cargo/env"
stty -ixon
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# alias cat='batcat --color=always'
# alias bat='batcat --color=always'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'bottom:40%' --preview 'batcat --color=always --style=header,grid --line-range :300 {}' --bind='ctrl-t:toggle-preview'"

# export FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name '\'*.tags'\'' -printf '\''%P\n'\'
export FZF_DEFAULT_COMMAND="rg --files --ignore-case --hidden -g '!{.git,node_modules,vendor}/*'"
# export BAT_THEME="TwoDark"
# Key bindings
# ------------
__fzf_select__() {
	local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
	eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
		printf '%q ' "$item"
	done
	echo
}

if [[ $- =~ i ]]; then

	__fzf_use_tmux__() {
		[ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
	}

	__fzfcmd() {
		__fzf_use_tmux__ &&
			echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
	}

	__fzf_select_tmux__() {
		local height
		height=${FZF_TMUX_HEIGHT:-40%}
		if [[ $height =~ %$ ]]; then
			height="-p ${height%\%}"
		else
			height="-l $height"
		fi

		tmux split-window $height "cd $(printf %q "$PWD"); FZF_DEFAULT_OPTS=$(printf %q "$FZF_DEFAULT_OPTS") PATH=$(printf %q "$PATH") FZF_CTRL_T_COMMAND=$(printf %q "$FZF_CTRL_T_COMMAND") FZF_CTRL_T_OPTS=$(printf %q "$FZF_CTRL_T_OPTS") bash -c 'source \"${BASH_SOURCE[0]}\"; RESULT=\"\$(__fzf_select__ --no-height)\"; tmux setb -b fzf \"\$RESULT\" \\; pasteb -b fzf -t $TMUX_PANE \\; deleteb -b fzf || tmux send-keys -t $TMUX_PANE \"\$RESULT\"'"
	}

	fzf-file-widget() {
		if __fzf_use_tmux__; then
			__fzf_select_tmux__
		else
			local selected="$(__fzf_select__)"
			READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
			READLINE_POINT=$((READLINE_POINT + ${#selected}))
		fi
	}

	__fzf_cd__() {
		local cmd dir
		cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
		dir=$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m) && printf 'cd %q' "$dir"
	}

	__fzf_history__() (
		local line
		shopt -u nocaseglob nocasematch
		line=$(
			HISTTIMEFORMAT= builtin history |
				FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd) |
				command grep '^ *[0-9]'
		) &&
			if [[ $- =~ H ]]; then
				sed 's/^ *\([0-9]*\)\** .*/!\1/' <<<"$line"
			else
				sed 's/^ *\([0-9]*\)\** *//' <<<"$line"
			fi
	)

	if [[ ! -o vi ]]; then
		# Required to refresh the prompt after fzf
		bind '"\er": redraw-current-line'
		bind '"\e^": history-expand-line'

		# CTRL-T - Paste the selected file path into the command line
		if [ $BASH_VERSINFO -gt 3 ]; then
			bind -x '"\C-t": "fzf-file-widget"'
		elif __fzf_use_tmux__; then
			bind '"\C-t": " \C-u \C-a\C-k`__fzf_select_tmux__`\e\C-e\C-y\C-a\C-d\C-y\ey\C-h"'
		else
			bind '"\C-t": " \C-u \C-a\C-k`__fzf_select__`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
		fi

		# CTRL-R - Paste the selected command from history into the command line
		bind '"\C-r": " \C-e\C-u\C-y\ey\C-u`__fzf_history__`\e\C-e\er\e^"'

		# ALT-C - cd into the selected directory
		bind '"\ec": " \C-e\C-u`__fzf_cd__`\e\C-e\er\C-m"'
	else
		# We'd usually use "\e" to enter vi-movement-mode so we can do our magic,
		# but this incurs a very noticeable delay of a half second or so,
		# because many other commands start with "\e".
		# Instead, we bind an unused key, "\C-x\C-a",
		# to also enter vi-movement-mode,
		# and then use that thereafter.
		# (We imagine that "\C-x\C-a" is relatively unlikely to be in use.)
		bind '"\C-x\C-a": vi-movement-mode'

		bind '"\C-x\C-e": shell-expand-line'
		bind '"\C-x\C-r": redraw-current-line'
		bind '"\C-x^": history-expand-line'

		# CTRL-T - Paste the selected file path into the command line
		# - FIXME: Selected items are attached to the end regardless of cursor position
		if [ $BASH_VERSINFO -gt 3 ]; then
			bind -x '"\C-t": "fzf-file-widget"'
		elif __fzf_use_tmux__; then
			bind '"\C-t": "\C-x\C-a$a \C-x\C-addi`__fzf_select_tmux__`\C-x\C-e\C-x\C-a0P$xa"'
		else
			bind '"\C-t": "\C-x\C-a$a \C-x\C-addi`__fzf_select__`\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'
		fi
		bind -m vi-command '"\C-t": "i\C-t"'

		# CTRL-R - Paste the selected command from history into the command line
		bind '"\C-r": "\C-x\C-addi`__fzf_history__`\C-x\C-e\C-x\C-r\C-x^\C-x\C-a$a"'
		bind -m vi-command '"\C-r": "i\C-r"'

		# ALT-C - cd into the selected directory
		bind '"\ec": "\C-x\C-addi`__fzf_cd__`\C-x\C-e\C-x\C-r\C-m"'
		bind -m vi-command '"\ec": "ddi`__fzf_cd__`\C-x\C-e\C-x\C-r\C-m"'
	fi

fi
stty -ixon
# zsh
# stty -ixon
exit

export TERM=xterm-256color
. "/home/jstitt/.deno/env"

