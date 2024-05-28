#!/usr/bin/sh

# this is a shell script to init my dotfiles.
# it is meant to be run on a fresh minimal install of Arch Linux.
# it is assumed that the the repo is cloned to $HOME/dots,
# and the script is run from within the dots directory.

# install paru - universal
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si
cd ..
rm -rf paru

# clone and install st - Mac
buildst () {
    git clone https://github.com/siduck/st
    cd st || exit
    sudo make && sudo make install
    cd ..
    rm -rf st
}

# Make hardcoded directories - universal
mkdir -p "$HOME"/Pictures/Wallpapers
mkdir -p "$HOME"/.local/bin

mkdir -p "$HOME"/Screenshots
mkdir -p "$HOME"/Desktop
mkdir -p "$HOME"/Downloads
mkdir -p "$HOME"/Music
mkdir -p "$HOME"/Pictures

mkdir -p "$HOME"/Documents/University
mkdir -p "$HOME"/Documents/Programs
mkdir -p "$HOME"/Documents/Vault

# 'device' is either MacbookPro2014 or Desktop
echo "Is this a mac? (y/n)" 
read -r mb
device=$(if [ "$mb" = "y" ]; then echo "MacbookPro2014"; else echo "Desktop"; fi)
deviceDir="$HOME/dots/$device"

#copy files - universal
cp -r "$deviceDir"/.config/* "$HOME"/.config/
cp -r "$deviceDir"/\$HOME/* "$HOME"/

#run installers - universal
. "$deviceDir"/\$HOME/packageInstall.sh

# rustup setup - universal
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y

if [ "$device" = "MacbookPro2014" ]; then
    buildst

    # move system files - Mac
    sudo mv "$deviceDir"/\$HOME/vestiges/hid_apple.conf /etc/modprobe.d/hid_apple.conf
    sudo mv "$deviceDir"/\$HOME/vestiges/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
    sudo mv "$deviceDir"/\$HOME/vestiges/org.rnd2.cpupower_gui.desktop /usr/share/applications/org.rnd2.cpupower_gui.desktop
    sudo mv "$deviceDir"/\$HOME/vestiges/spotify_player.desktop /usr/share/applications/spotify_player.desktop
    sudo mv "$deviceDir"/\$HOME/vestiges/syncthing.desktop /usr/share/applications/syncthing.desktop
    rm -rf "$HOME"/vestiges

    # enable mbpfan and NetworkManager service - Mac
    sudo systemctl enable NetworkManager
    sudo systemctl enable mbpfan

    # make Polybar scripts executable - Mac
    chmod +x "$HOME"/.config/polybar/launch.sh
    chmod +x "$HOME"/.config/polybar/scripts/player-mpris-simple.sh

    # make berry scripts executable - Mac
    chmod +x "$HOME"/.config/berry/autostart
    chmod +x "$HOME"/.config/berry/launch.sh

    # make bspwm scripts executable - Mac
    chmod +x "$HOME"/.config/bspwm/bspwmrc
    chmod +x "$HOME"/.config/bspwm/centerWindow.sh
    chmod +x "$HOME"/.config/bspwm/pointer1mode.sh

    # make eww scripts executable - Mac
    chmod +x "$HOME"/.config/eww/scripts/battery
    chmod +x "$HOME"/.config/eww/scripts/bspwm_getWorkspace
    chmod +x "$HOME"/.config/eww/scripts/media
    chmod +x "$HOME"/.config/eww/scripts/volume

    # make rofi scripts executable - Mac (for now...)
    chmod +x "$HOME"/.config/rofi/scripts/launcher.sh
    chmod +x "$HOME"/.config/rofi/scripts/powermenu.sh

    # Install Eww for X11
    git clone https://github.com/elkowar/eww ~/Documents/Programs/eww
    cd ~/Documents/Programs/eww || exit
    cargo build -r --no-default-features --features x11
    sudo mv target/release/eww $HOME/.local/bin
    chmod +x $HOME/.local/bin/eww
fi

# Install swamp GTK theme + Firefox chrome - universal
git clone https://github.com/masroof-maindak/swamp.nvim.git
cd swamp.nvim || exit
cd extras || exit
cd gtk || exit
make && sudo make install
cd ..
mv firefox/* "$HOME"/mozilla/firefox/*.default-release/chrome/
cd ../..
rm -rf swamp.nvim

# git ssh setup - universal
ssh-keygen -t rsa -b 4096 -C "mujtaba.asim.amin@gmail.com" -f $HOME/.ssh/id_rsa -N ""
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_rsa
cat $HOME/.ssh/id_rsa.pub > $HOME/paste-me-into-github-settings
git config --global user.name "masroof-maindak"
git config --global user.email "mujtaba.asim.amin@gmail.com"

# Install spotify-player - universal
git clone https://github.com/aome510/spotify-player.git $HOME/Documents/Programs/spotify-player
cd $HOME/Documents/Programs/spotify-player || exit
cargo build -r --features lyric-finder,notify
mv target/release/spotify_player $HOME/.local/bin/spotify_player
chmod +x $HOME/.local/bin/spotify_player

# clone neovim - universal
git clone https://github.com/masroof-maindak/nvim.git "$HOME"/.config/nvim

# clean up
rm -rf "$HOME"/dots
