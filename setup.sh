#!/bin/sh
# sign in to Mac App Store up front

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install dependencies
make default
make ext

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp zshrc ~/.zshrc

# vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

# keyboard settings
# https://gist.github.com/kconragan/2510186
defaults write -g ApplePressAndHoldEnabled -bool false

# disable gatekeeper
sudo spctl --master-disable
