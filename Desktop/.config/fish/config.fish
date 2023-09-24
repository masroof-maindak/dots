if status is-interactive
    # Commands to run in interactive sessions can go here

    set -Ux BROWSER firefox
    set -Ux TERMINAL foot
    set -Ux SUDOEDITOR helix

    set fish_greeting

    alias q="exit"
    alias c="clear"
    alias h="helix"
    alias r="ranger"

    alias uni="cd ~/Documents/university"
    alias cfg="cd ~/.config"
    
    fish_add_path -mg $HOME/.local/bin
    fish_add_path -mg $HOME/.cargo/bin
end
