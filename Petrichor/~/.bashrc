#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias ls="ls -hN --color=auto --group-directories-first"
alias grep='grep --color=auto'

PS1='[\W] '

alias cl="clear"
alias q="exit"

alias v="nvim"
alias r="ranger"
alias p="pacman"

alias i3w="startx ~/.xinitrc i3"
alias awm="startx ~/.xinitrc awesome"
alias ber="startx ~/.xinitrc berry"
alias bsp="startx ~/.xinitrc bspwm"

alias i3wc="cd .config/i3/"
ali

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
