# update all packages before installation
yay -Syyu

yay -S zsh neovim vim kitty polybar dunst rofi sddm neofetch

sudo systemctl enable sddm.service

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Completed!"
