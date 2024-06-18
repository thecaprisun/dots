#!/bin/bash

# ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗        ███████╗██╗  ██╗
# ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║        ██╔════╝██║  ██║
# ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║        ███████╗███████║
# ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║        ╚════██║██╔══██║
# ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██╗███████║██║  ██║
# ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝

# from github.com/thecaprisun/dots
# add me on discord, _the.sun_
# email me at sun@bleedingbox.dev

clear

echo "██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗        ███████╗██╗  ██╗"
echo "██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║        ██╔════╝██║  ██║"
echo "██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║        ███████╗███████║"
echo "██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║        ╚════██║██╔══██║"
echo "██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██╗███████║██║  ██║"
echo "╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝"

echo "╔══════════════════════════════════════════════════════════════════════════════════╗"
echo "║This will install my dotfiles onto your system.                                   ║"
echo "║Your current configurations (if you have any) will be backed up to ~/.old-configs.║"
echo "╚══════════════════════════════════════════════════════════════════════════════════╝"

echo "Do you want to continue? (y/n)"
read input
if [ "$input" != "y" ]; then
    echo "Aborting."
    exit 1
fi

packages="i3 polybar alacritty rofi vim picom nitrogen polkit-gnome pulseaudio"

install_packages() {
    local pkg_manager=$1
    local install_command=$2

    echo "Installing packages using $pkg_manager..."
    sudo $install_command $packages
}

echo "Detecting package manager..."
if command -v apt-get >/dev/null; then
    pkg_manager="apt-get"
    install_command="apt-get install -y"
    echo "Detected apt-get"
elif command -v yum >/dev/null; then
    pkg_manager="yum"
    install_command="yum install -y"
    echo "Detected yum"
elif command -v dnf >/dev/null; then
    pkg_manager="dnf"
    install_command="dnf install -y"
    echo "Detected dnf"
elif command -v pacman >/dev/null; then
    pkg_manager="pacman"
    install_command="pacman -S --noconfirm"
    echo "Detected pacman"
elif command -v zypper >/dev/null; then
    pkg_manager="zypper"
    install_command="zypper install -y"
    echo "Detected zypper"
elif command -v emerge >/dev/null; then
    pkg_manager="emerge"
    install_command="emerge"
    echo "Detected emerge"
elif command -v xbps-install >/dev/null; then
    pkg_manager="xbps-install"
    install_command="xbps-install -Sy"
    echo "Detected xbps-install"
elif command -v apk >/dev/null; then
    pkg_manager="apk"
    install_command="apk add"
    echo "Detected apk"
else
    echo "Error: No supported package manager found, you'll have to install the dependencies by hand."
    pkg_manager=""
fi

if [ -n "$pkg_manager" ]; then
    echo "Updating the system..."
    case $pkg_manager in
        apt-get)
            sudo apt-get update
            ;;
        dnf | yum)
            sudo $pkg_manager makecache
            ;;
        zypper)
            sudo zypper refresh
            ;;
        xbps-install)
            sudo xbps-install -Syu
            ;;
        apk)
            sudo apk update
            ;;
    esac
    install_packages $pkg_manager "$install_command"
    echo "Installation of packages completed."
else
    echo "Skipping package installation due to unsupported package manager."
fi

echo "Backing up current configurations to ~/.old-configs..."

backup_dir=~/.old-configs
mkdir -p $backup_dir

configs=("i3" "alacritty" "polybar" "rofi" "picom.conf" "vimrc")

for config in "${configs[@]}"; do
    if [ -e ~/.config/$config ] || [ -e ~/$config ]; then
        cp -r ~/.config/$config $backup_dir 2>/dev/null || cp ~/$config $backup_dir
    fi
done

echo "Removing old configurations..."
for config in "${configs[@]}"; do
    rm -rf ~/.config/$config 2>/dev/null || rm -f ~/$config
done

echo "Cloning the dotfiles repo..."
git clone https://github.com/thecaprisun/dots

echo "Moving the new dotfiles..."
cd dots
cp -r config/* ~/.config/
cp .vimrc ~/

echo "Installing JetBrainsMono Nerd Font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip -d ~/.local/share/fonts JetBrainsMono.zip

echo "Done!"

#      ******       ******
#    **********   **********
#  ************* *************
# *****************************
# *****************************
# *****************************
#  ***************************
#    ***********************
#      *******************
#        ***************
#          ***********
#            *******
#              ***
