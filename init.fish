#!/usr/bin/env fish
#-----update System packages-----
sudo pacman -Syyu

#-----install fundamental packages-----
#install paru
sudo pacman -S paru

#install cachyos gaming packages
paru -S cachyos-gaming-meta

#-----install caelestia-----
#install prerequisite
log 'Install prerequisite dependencies for caelestia'
paru -S quickshell-git caelestia-shell-git

#install caelestia-dots
git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
~/.local/share/caelestia/install.fish --noconfirm --paru

#install caelestia-dots(user)
log 'Installing caelestia(user) configs...'
rm -rf $HOME/.config/caelestia
ln -s (realpath caelestia) $HOME/.config/caelestia

#-----install other packages-----
#install fcitx5 with chewing
paru -S fcitx5 fcitx5-configtool fcitx5-chewing
log 'Install fcitx5 configs...'
rm -rf $HOME/.config/fcitx5
ln -s (realpath fcitx5) $HOME/.config/fcitx5

#install lazyvim
paru -S neovim
log 'Install nvim(lazyvim) configs...'
rm -rf $HOME/.config/nvim
ln -s (realpath nvim) $HOME/.config/nvim

#install MangoHud
paru -S mangohud mangojuice
log 'Install Mangohud configs...'
rm -rf $HOME/.config/MangoHud
ln -s (realpath MangoHud) $HOME/.config/MangoHud

#install zen-browser
paru -S zen-browser-bin
log 'Install zen-browser configs...'
mv $HOME/.zen/*/chrome{,.bak}
ln -s (realpath chrome) $HOME/.zen/*/chrome

#-----reload-----
hyprctl reload
