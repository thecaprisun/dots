#!/bin/sh

# ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗        ███████╗██╗  ██╗
# ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║        ██╔════╝██║  ██║
# ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║        ███████╗███████║
# ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║        ╚════██║██╔══██║
# ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██╗███████║██║  ██║
# ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝

# from github.com/thecaprisun/dots
# add me on discord, _the.sun_
# email me at sun@bleedingbox.dev

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

read -p "Do you want to continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo "Installing packages..."

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

echo "Updating the system..."

if [ "$pkg_manager" = "apt-get" ]; then
    echo "Updating package lists for apt-get..."
    sudo apt-get update
elif [ "$pkg_manager" = "dnf" ] || [ "$pkg_manager" = "yum" ]; then
    echo "Updating package lists for $pkg_manager..."
    sudo $pkg_manager makecache
elif [ "$pkg_manager" = "zypper" ]; then
    echo "Updating package lists for zypper..."
    sudo zypper refresh
elif [ "$pkg_manager" = "xbps-install" ]; then
    echo "Updating package lists for xbps-install..."
    sudo xbps-install -Syu
elif [ "$pkg_manager" = "apk" ]; then
    echo "Updating package lists for apk..."
    sudo apk update
fi

echo "Installing the packages..."

if [ -n "$pkg_manager" ]; then
    install_packages $pkg_manager "$install_command"
    echo "Installation of packages completed."
else
    echo "Skipping package installation due to unsupported package manager."
fi

echo "Backing up i3, polybar, alacritty, rofi and picom configs to ~/.old-configs..."

mkdir ~/.old-configs

cp -r ~/.config/i3 ~/.old-configs
cp -r ~/.config/alacritty ~/.old-configs
cp -r ~/.config/polybar ~/.old-configs
cp -r ~/.config/rofi ~/.old-configs
cp -r ~/.config/picom.conf ~/.old-configs
cp -r ~/.vimrc ~/.old-configs
cp -r ~/.config/i3 ~/.old-configs

rm -rf ~/.config/alacritty
rm -rf ~/.config/polybar
rm -rf ~/.config/rofi
rm -rf ~/.config/picom.conf
rm -rf ~/.vimrc

echo "Cloning the dotfiles repo..."

git clone https://github.com/thecaprisun/dots

echo "Moving the new dotfiles..."

cd dots
cp -r ~/.config/ .
cp -r ./config/* ~/.config
cp -r ./.vimrc ~

echo

echo "Installing JetBrainsMono Nerd Font..."

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

mkdir ~/.local/

mkdir ~/.local/share/

mkdir ~/.local/share/fonts

unzip -d ~/.local/share/fonts JetBrainsMono.zip

echo "Done!"

fi

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
