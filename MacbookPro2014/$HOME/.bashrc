#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Shell prompt
#function prompt_right() {
#  echo -e "\033[0;36mmaindak\033[0m"
#}
#
#function prompt_left() {
#  echo -e "\033[0;35m\W\033[0m"
#}
#
#function prompt() {
#    compensate=11
#    PS1=$(printf "%*s\r%s $ " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
#}

#export PS1="\[\e[48;2;140;207;126;38;2;20;23;30m\] λ \[\e[48;2;35;42;45;38;2;218;218;218m\] \\W \[\e[m\] "
PS1="\W >> "

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias ls="ls -hN --color=auto --group-directories-first"
alias grep='grep --color=auto'

alias c="clear"
alias q="exit"

alias v="nvim"
alias r="ranger"
alias p="pacman"

alias pkg="pacman -Q | wc -l"
alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage"

alias uni="cd ~/Documents/University/"

alias doc="cd ~/Documents/"
alias uni="cd ~/Documents/University/"
alias cfg="cd ~/.config/"

alias bsp="startx ~/.xinitrc bspwm"
alias bsc="nvim ~/.config/bspwm/bspwmrc"
alias sxc="nvim ~/.config/sxhkd/sxhkdrc"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"