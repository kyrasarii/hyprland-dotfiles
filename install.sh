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
sudo pacman -S --noconfirm \
  adw-gtk-theme base \
  base-devel \
  blueman \
  bluez \
  bluez-utils \
  brightnessctl \
  btop \
  btrfs-progs \
  dkms \
  efibootmgr \
  feh \
  firefox \
  fish \
  fuzzel \
  fzf \
  git \
  grim \
  gst-plugin-pipewire \
  hyprland \
  hyprpicker \
  imagemagick \
  intel-ucode \
  iwd \
  kitty \
  kvantum \
  lazygit \
  libpulse \
  libreoffice-fresh \
  libva-nvidia-driver \
  linux \
  linux-firmware \
  linux-headers \
  ly \
  mako \
  mpv \
  neovim \
  network-manager-applet \
  networkmanager \
  npm \
  nvidia-dkms \
  nwg-look \
  pavucontrol \
  pipewire \
  pipewire-alsa \
  pipewire-jack \
  pipewire-pulse \
  playerctl \
  polkit-kde-agent \
  power-profiles-daemon \
  python-gobject \
  qt5-wayland \
  qt5ct \
  qt6-wayland \
  qt6ct \
  slurp \
  smartmontools \
  sof-firmware \
  swww \
  ttf-fira-code \
  unzip \
  uwsm \
  vi \
  vim \
  vulkan-headers \
  vulkan-tools \
  waybar \
  wf-recorder \
  wget \
  wireless_tools \
  wireplumber \
  xdg-desktop-portal-hyprland \
  xdg-utils \
  yazi \
  zenity \
  zram-generator

# Install AUR packages with paru
echo "Installing AUR packages with paru..."
paru -S --noconfirm \
  wallust \
  wlogout

cd
# Copy config files
echo "Copying configuration files..."
cp -r ~/hyprland-dotfiles/.config/* ~/.config/

# Change shell to fish
echo "Changing default shell to fish. You will be prompted for your password."
chsh -s /usr/bin/fish

echo "Installation complete! Please reboot your system to apply all changes."
