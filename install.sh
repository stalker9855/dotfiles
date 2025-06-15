#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if ! command -v yay &> /dev/null; then
  echo "Command 'yay' not found. Installing..."
  git clone https://github.com/Jguer/yay.git
  cd yay
  makepkg -Si
  cd ..
  rm -rf yay
fi

# Change shell to zsh and install oh-my-zsh
sudo pacman -S zsh --needed --noconfirm
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -f ./packages.txt ]; then
  yay -S --needed --noconfirm $(< packages.txt)
else
  echo "Packages file not found. Aborting..."
  return 1
fi

# Install stow
read -p "Do you want to use Stow to apply config using symlinks? (y/n): " response
case $response in
    [yY] ) echo "Installing... stow"; sudo pacman -S --needed --noconfirm stow; stow . ;;
    [nN] ) echo "Done."; exit 1 ;;
esac

