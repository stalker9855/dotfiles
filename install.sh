#!/bin/sh

if ! command -v yay &> /dev/null; then
  echo "Command 'yay' not found. Installing..."
  git clone https://github.com/Jguer/yay.git
  cd yay
  makepkg -Si
  cd ..
  rm -rf yay
fi

# Change shell to zsh and install oh-my-zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -f ./packages.txt ]; then
  yay -S - < ./packages.txt
else
  echo "Packages file not found. Aborting..."
  return 1
fi

# Copy all contents to home directory
cp -r .* "$HOME" 2>/dev/null
if [ -d "$HOME/.git" ]; then
  rm -rf "$HOME/.git"
fi

# Make files (sh) executed
cd $HOME/.config
chmod -R u+x bspwm/* sxhkd/* scripts/* polybar/* 2>/dev/null

