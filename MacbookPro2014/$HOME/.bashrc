# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Binds
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\C-o":"lfcd\C-m"' # CTRL + O = lfcd
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Prompt
PS1="\033[0;33m\W\033[0m ;; "
# PS1="\033[0;33m\w\033[0m \n$ "
# PS1="\033[0;33m\W\033[0m\nΣ "

# Aliases
alias ls="ls -hN --color=auto --group-directories-first"
alias grep="rg"

alias c="clear"
alias q="exit"
alias dd="dragon-drop"

alias v="nvim"
alias p="pacman"

alias pkg="pacman -Q | wc -l"
alias bt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage"
    
alias scr="cd ~/Screenshots/"
alias dow="cd ~/Downloads/"
alias doc="cd ~/Documents/"
alias uni="cd ~/Documents/University/"
alias asm="cd ~/Documents/University/CAAL/ASM/"
alias cfg="cd ~/.config/"

alias bsp="startx ~/.xinitrc bspwm"
alias ber="startx ~/.xinitrc berry"
alias i3wm="startx ~/.xinitrc i3"

alias brc="v ~/.bashrc"
alias bsc="v ~/.config/bspwm/bspwmrc"
alias i3c="v ~/.config/i3/config"
alias sxc="v ~/.config/sxhkd/sxhkdrc"

alias pubip='curl ipinfo.io/ip'

# Functions
lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

mkcd () {
    mkdir -p -- "$1" && cd -P -- "$1"
}

# Add bins to PATH if not exist
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
