#!/bin/sh

# vim config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

# download and install iTerm2 color presets
curl https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/master/Snazzy.itermcolors -o ~/Downloads/Snazzy.itermcolors
open ~/Downloads/Snazzy.itermcolors

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cp zshrc ~/.zshrc
touch ~/.zshrc_ext

# install pure prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
source ~/.zshrc

# config for macOS
source ./macOS.sh

