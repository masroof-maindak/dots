# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias q="exit"
alias v="nvim"
alias bonsai="cbonsai -p"
alias cl="clear"
alias r="ranger"
alias fetch="neofetch --ascii_distro fedora_small"
unset rc

fetch

. "$HOME/.cargo/env"
export PATH=$PATH:/home/vagabond/.spicetify
