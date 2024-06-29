# update all packages before installation
#
#
#
#
#
yay -Syyu

yay -S zsh neovim vim kitty polybar dunst rofi sddm neofetch feh

sudo systemctl enable sddm.service


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp -r .config $HOME/
cp -r .local/share $HOME/
cp .zshrc $HOME/

source $HOME/.zshrc

feh --bg-fill ~/.config/wallpapers/touka.jpg

echo "Completed!"
