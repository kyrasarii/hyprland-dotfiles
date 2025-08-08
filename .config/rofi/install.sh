#!/bin/bash

# Main user directory
cd ~

# Create directories
mkdir -p Clones Documents Downloads Pictures Videos Projects

# Change to Clones directory and install paru
echo "Installing paru from AUR..."
cd ~/Clones
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm

# Install packages with pacman
echo "Updating system and installing main packages with pacman..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm bluez bluez-utils brightnessctl dunst feh firefox fish git grim gst-plugin-pipewire htop hyprland hyprpicker kitty libpulse ly neovim playerctl polkit-kde-agent qt5-wayland qt6-wayland slurp smartmontools swww ttf-fira-code uwsm vim waybar wget wireplumber wofi xdg-desktop-portal-hyprland xdg-utils xorg-server xorg-xinit yazi zenity

# Install packages with paru
echo "Installing additional packages with paru..."
paru -S --noconfirm pfetch wallust

# Copy config files
echo "Copying configuration files..."
cp -r ~/hyprland-dotfiles/.config/* ~/.config/

# Change shell to fish
echo "Changing default shell to fish. You will be prompted for your password."
chsh -s /usr/bin/fish

echo "Installation complete! Please reboot your system to apply all changes."
