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

sleep 1

echo
echo "This will install my dotfiles onto your system."
sleep 1

echo "For now you will have to install the dependencies specified in the readme by hand, sorry for the inconvenienve, this will be automatic in a future version."
sleep 2

echo "Your current configurations (if you have any) will be backed up to ~/.old-configs."
sleep 2

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
