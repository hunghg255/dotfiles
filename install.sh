#!/usr/bin/env bash
ZSH=$HOME/.oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm -rf dotfiles
git clone https://github.com/hunghg255/dotfiles.git --depth=1
cd dotfiles

cp -f gitconfig $HOME/.gitconfig
cp -f hunghg255.zsh-theme $ZSH/themes/
cp -f zshrc $HOME/.zshrc
rm -rf dotfiles
