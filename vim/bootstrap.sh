#!/bin/bash

# On Feb 23 2020 I added nvim support.
# Vim is still bootstrapped, but has a more minimal config

set -euo pipefail

cd "$(dirname "$0")/.." || exit

echo "[1/7] Linking neovim init.vm"
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/vim/init.vim" "$HOME/.config/nvim/init.vim"

echo "[2/7] Linking vimrc"
ln -sf "$PWD/vim/vimrc" "$HOME/.vimrc"

echo "[3/7] Installing vim-plug to neovim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[4/7] Installing vim-plug to vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[5/7] Installing deoplete python prereqs"
pip3 install --user --upgrade pynvim

echo "[6/7] Install Plugins for neovim"
nvim +PlugInstall +qall

echo "[7/7] Install Plugins for vim"
vim +PlugInstall +qall
