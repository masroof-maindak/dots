#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias ls="ls -hN --color=auto --group-directories-first"
alias grep='grep --color=auto'

PS1='\W π '

alias cl="clear"
alias q="exit"

alias v="nvim"
alias r="ranger"
alias p="pacman"

alias ber="startx ~/.xinitrc berry"
alias bsp="startx ~/.xinitrc bspwm"

alias ewc="cd .config/eww/"
alias bec="cd .config/berry/"
alias bsc="nvim .config/bspwm/bspwmrc"
alias sxc="nvim .config/sxhkd/sxhkdrc"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
