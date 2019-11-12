#!/usr/bin/env bash

# Not idempotent.
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  echo "Creating an ssh key"
  ssh-keygen -t rsa

  echo "Please add to Github\n"
  cat ~/.ssh/id_rsa.pub
  read -p "Press Enter to continue..."
fi

#echo "Installing xcode utils"
#xcode-select --install

if test ! $(which brew); then
  echo "Installing homebrew"
  curl --remote-name https://raw.githubusercontent.com/Homebrew/install/master/install
  read -p "Press Enter after confirming the homebrew install script..."
  ruby ./install
fi

defaults write -g com.apple.trackpad.scaling 2

# Install JDK
# Run brewfile
# Clone and setup dotfiles
# Install vundle.
