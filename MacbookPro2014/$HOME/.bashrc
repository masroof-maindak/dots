#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shell prompt
function prompt_right() {
  echo -e "\033[0;36mmaindak\033[0m"
}

function prompt_left() {
  echo -e "\033[0;35m\W\033[0m"
}

function prompt() {
    compensate=11
    PS1=$(printf "%*s\r%s $ " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}
PROMPT_COMMAND=prompt

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias ls="ls -hN --color=auto --group-directories-first"
alias grep='grep --color=auto'

alias cl="clear"
alias q="exit"

alias v="nvim"
alias r="ranger"
alias p="pacman"

alias pkg="pacman -Q | wc -l"
alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep
percentage"

alias ber="startx ~/.xinitrc berry"
alias bsp="startx ~/.xinitrc bspwm"

alias bec="cd .config/berry"
alias ewc="cd .config/eww/"

alias bsc="nvim .config/bspwm/bspwmrc"
alias sxc="nvim .config/sxhkd/sxhkdrc"

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
