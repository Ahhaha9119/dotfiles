#!/usr/bin/env fish
#-----update System packages-----
sudo pacman -Syyu

#-----install fundamental packages-----
#install paru
sudo pacman -S paru

#install cachyos gaming packages
paru -S cachyos-gaming-meta

#-----user setup-----
#gitconfig setup
log 'Install gitconfig...'
ln -sf (realpath .gitconfig) $HOME/.gitconfig

#-----install caelestia-----
#install prerequisite
log 'Install prerequisite dependencies for caelestia'
paru -S quickshell-git caelestia-shell

#install caelestia-dots
git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
~/.local/share/caelestia/install.fish --noconfirm --paru

#install Bibata Cursors
paru -S bibata-cursor-theme-bin

#install caelestia-dots(user)
log 'Install caelestia(user) configs...'
mv $HOME/.config/caelestia{,.bak}
mv $HOME/Pictures/Wallpapers{,bak}
ln -s (realpath caelestia) $HOME/.config/caelestia
ln -s (realpath Wallpapers) $HOME/Pictures/Wallpapers
caelestia wallpaper -f (realpath black-aesthetic-1920X1080-wallpaper-1fdqsi6u8wfz8rno.jpeg)
caelestia scheme set -n dynamic

#-----install other packages-----
#install fcitx5 with chewing
paru -S fcitx5 fcitx5-configtool fcitx5-chewing
log 'Install fcitx5 configs...'
mv $HOME/.config/fcitx5{,.bak}
ln -s (realpath fcitx5) $HOME/.config/fcitx5

#install lazyvim
paru -S neovim
log 'Install nvim(lazyvim) configs...'
mv $HOME/.config/nvim{,.bak}
ln -s (realpath lua) $HOME/.config/nvim/lua

#install MangoHud
paru -S mangohud mangojuice
log 'Install Mangohud configs...'
mv $HOME/.config/MangoHud{,.bak}
ln -s (realpath MangoHud) $HOME/.config/MangoHud

#install zen-browser
paru -S zen-browser-bin
log 'Install zen-browser configs...'
mv $HOME/.zen/*/chrome{,.bak}
ln -s (realpath chrome) $HOME/.zen/*/chrome

#-----reload-----
hyprctl reload
