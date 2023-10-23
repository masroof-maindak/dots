#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\033[0;33m\W\033[0m\nΣ "

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="rg"

alias c="clear"
alias q="exit"
alias dd="dragon-drop"

alias v="nvim"
alias r="ranger"
alias p="pacman"

alias pkg="pacman -Q | wc -l"
alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage"

alias doc="cd ~/Documents/"
alias uni="cd ~/Documents/University/"
alias cfg="cd ~/.config/"

alias bsp="startx ~/.xinitrc bspwm"

alias brc="nvim ~/.bashrc"
alias bsc="nvim ~/.config/bspwm/bspwmrc"
alias sxc="nvim ~/.config/sxhkd/sxhkdrc"

case ":${PATH}:" in
    *:"$HOME/.local/bin":*)
        ;;
    *)
        export PATH="$HOME/.local/bin:$PATH"
        ;;
esac
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac
