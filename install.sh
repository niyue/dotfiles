#!/bin/sh
# sign in to Mac App Store up front

# use tsinghua homebrew
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"


# install homebrew for both intel mac and arm
# https://stackoverflow.com/questions/64951024/how-can-i-run-two-isolated-installations-of-homebrew

# install homebrew
echo "cloning homebrew git repo"
# git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
git clone --depth=1 https://github.com/Homebrew/install.git brew-install

echo "running homebrew installation script"
/bin/bash brew-install/install.sh
rm -rf brew-install

# install dependencies
echo "installing default apps"
make default

echo "installing extended apps"
make ext
